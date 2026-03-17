

#include <QDateTime>
#include <QDebug>
#include <QDir>
#include <QDirIterator>
#include <QFileInfo>
#include <QFileSystemWatcher>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QTimer>
#include <QUrl>
#include <QWindow>

int main(int argc, char *argv[]) {
  // 必须在 QGuiApplication 之前设置 Style
  QQuickStyle::setStyle("Basic");
  qDebug()<<123;
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;


  // 处理加载失败
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
      []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);

#ifdef LOAD_FROM_LOCAL

  qDebug() << "Running in [DEV MODE] 🛠️ (Recursive Directory Watch Mode)";

  const QString qmlMainFilePath = QStringLiteral(QML_LOCAL_PATH);
  QFileInfo mainFileInfo(qmlMainFilePath);
  const QString projectRoot = mainFileInfo.absolutePath(); // 项目根目录

  // 1. 递归监视器：监视根目录及其所有子目录
  QFileSystemWatcher *watcher = new QFileSystemWatcher(&app);

  // 添加根目录
  watcher->addPath(projectRoot);

  // 递归添加所有子文件夹，确保 Layout 等子目录变动能被捕捉
  QDirIterator it(projectRoot, QDir::Dirs | QDir::NoDotAndDotDot,
                  QDirIterator::Subdirectories);
  while (it.hasNext()) {
    QString subDir = it.next();
    watcher->addPath(subDir);
    qDebug() << "Watching subdirectory:" << subDir;
  }

  // 2. 核心设置：让引擎优先从磁盘加载模块（解决 import BaseLayout
  // 加载旧资源问题）
  engine.addImportPath(projectRoot);

  // 防抖定时器
  QTimer *debounceTimer = new QTimer(&app);
  debounceTimer->setSingleShot(true);
  debounceTimer->setInterval(300);

  auto reloadQml = [&engine, qmlMainFilePath, projectRoot]() {
    qDebug() << "🔄 Detected changes, performing hot reload...";
    // 1. 销毁旧窗口
    const auto oldRoots = engine.rootObjects();
    for (auto *oldWin : oldRoots) {
      if (oldWin)
        delete oldWin;
    }

    // 2. 【核心修复】：清除所有缓存，并重新强制设置导入路径
    engine.clearComponentCache();

    // 强制让本地项目根目录排在导入路径的最前面
    QStringList importPaths = engine.importPathList();
    if (!importPaths.contains(projectRoot)) {
      engine.addImportPath(projectRoot);
    }

    // 3. 构造带随机参数的 URL 强制引擎认为这是一个全新的请求
    QString timestamp = QString::number(QDateTime::currentMSecsSinceEpoch());
    QUrl url = QUrl::fromLocalFile(qmlMainFilePath);
    url.setQuery("t=" + timestamp);

    engine.load(url);

    if (!engine.rootObjects().isEmpty()) {
      qDebug() << "✅ Reload Success! (t=" << timestamp << ")";
    } else {
      qWarning() << "⚠️ Reload Failed! Check QML syntax errors.";
    }
  };

  // 连接变动信号
  auto onChange = [debounceTimer, reloadQml](const QString &path) {
    qDebug() << "📂 File/Dir changed:" << path;
    debounceTimer->stop();
    // 重新连接以确保只触发一次
    QObject::disconnect(debounceTimer, &QTimer::timeout, nullptr, nullptr);
    QObject::connect(debounceTimer, &QTimer::timeout, reloadQml);
    debounceTimer->start();
  };

  QObject::connect(watcher, &QFileSystemWatcher::directoryChanged, &app,
                   onChange);
  QObject::connect(watcher, &QFileSystemWatcher::fileChanged, &app, onChange);

  reloadQml(); // 初始加载
#else
  qDebug() << "Running in [RELEASE MODE] 🚀";
  app.setQuitOnLastWindowClosed(true);
  engine.loadFromModule("BaseLayout", "Main");
#endif

  return app.exec();
}
