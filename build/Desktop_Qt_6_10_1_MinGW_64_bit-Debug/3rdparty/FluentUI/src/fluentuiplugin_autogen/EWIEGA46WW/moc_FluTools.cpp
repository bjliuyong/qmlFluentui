/****************************************************************************
** Meta object code from reading C++ file 'FluTools.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTools.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTools.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.10.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN8FluToolsE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTools::qt_create_metaobjectdata<qt_meta_tag_ZN8FluToolsE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTools",
        "QML.Element",
        "QML.Singleton",
        "true",
        "qtMajor",
        "",
        "qtMinor",
        "isMacos",
        "isLinux",
        "isWin",
        "clipText",
        "text",
        "uuid",
        "readFile",
        "fileName",
        "setQuitOnLastWindowClosed",
        "val",
        "setOverrideCursor",
        "Qt::CursorShape",
        "shape",
        "restoreOverrideCursor",
        "html2PlantText",
        "html",
        "toLocalPath",
        "QUrl",
        "url",
        "deleteLater",
        "p",
        "getFileNameByUrl",
        "getVirtualGeometry",
        "QRect",
        "getApplicationDirPath",
        "getUrlByFilePath",
        "path",
        "withOpacity",
        "QColor",
        "alpha",
        "md5",
        "sha256",
        "toBase64",
        "fromBase64",
        "removeDir",
        "dirPath",
        "removeFile",
        "filePath",
        "showFileInFolder",
        "isSoftware",
        "currentTimestamp",
        "cursorPos",
        "QPoint",
        "windowIcon",
        "QIcon",
        "cursorScreenIndex",
        "windowBuildNumber",
        "isWindows11OrGreater",
        "isWindows10OrGreater",
        "desktopAvailableGeometry",
        "QQuickWindow*",
        "window",
        "getWallpaperFilePath",
        "imageMainColor",
        "QImage",
        "image",
        "bright"
    };

    QtMocHelpers::UintData qt_methods {
        // Method 'qtMajor'
        QtMocHelpers::MethodData<int()>(4, 5, QMC::AccessPublic, QMetaType::Int),
        // Method 'qtMinor'
        QtMocHelpers::MethodData<int()>(6, 5, QMC::AccessPublic, QMetaType::Int),
        // Method 'isMacos'
        QtMocHelpers::MethodData<bool()>(7, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'isLinux'
        QtMocHelpers::MethodData<bool()>(8, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'isWin'
        QtMocHelpers::MethodData<bool()>(9, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'clipText'
        QtMocHelpers::MethodData<void(const QString &)>(10, 5, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 11 },
        }}),
        // Method 'uuid'
        QtMocHelpers::MethodData<QString()>(12, 5, QMC::AccessPublic, QMetaType::QString),
        // Method 'readFile'
        QtMocHelpers::MethodData<QString(const QString &)>(13, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 14 },
        }}),
        // Method 'setQuitOnLastWindowClosed'
        QtMocHelpers::MethodData<void(bool)>(15, 5, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 16 },
        }}),
        // Method 'setOverrideCursor'
        QtMocHelpers::MethodData<void(Qt::CursorShape)>(17, 5, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 18, 19 },
        }}),
        // Method 'restoreOverrideCursor'
        QtMocHelpers::MethodData<void()>(20, 5, QMC::AccessPublic, QMetaType::Void),
        // Method 'html2PlantText'
        QtMocHelpers::MethodData<QString(const QString &)>(21, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 22 },
        }}),
        // Method 'toLocalPath'
        QtMocHelpers::MethodData<QString(const QUrl &)>(23, 5, QMC::AccessPublic, QMetaType::QString, {{
            { 0x80000000 | 24, 25 },
        }}),
        // Method 'deleteLater'
        QtMocHelpers::MethodData<void(QObject *)>(26, 5, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QObjectStar, 27 },
        }}),
        // Method 'getFileNameByUrl'
        QtMocHelpers::MethodData<QString(const QUrl &)>(28, 5, QMC::AccessPublic, QMetaType::QString, {{
            { 0x80000000 | 24, 25 },
        }}),
        // Method 'getVirtualGeometry'
        QtMocHelpers::MethodData<QRect()>(29, 5, QMC::AccessPublic, 0x80000000 | 30),
        // Method 'getApplicationDirPath'
        QtMocHelpers::MethodData<QString()>(31, 5, QMC::AccessPublic, QMetaType::QString),
        // Method 'getUrlByFilePath'
        QtMocHelpers::MethodData<QUrl(const QString &)>(32, 5, QMC::AccessPublic, 0x80000000 | 24, {{
            { QMetaType::QString, 33 },
        }}),
        // Method 'withOpacity'
        QtMocHelpers::MethodData<QColor(const QColor &, qreal)>(34, 5, QMC::AccessPublic, 0x80000000 | 35, {{
            { 0x80000000 | 35, 5 }, { QMetaType::QReal, 36 },
        }}),
        // Method 'md5'
        QtMocHelpers::MethodData<QString(const QString &)>(37, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 11 },
        }}),
        // Method 'sha256'
        QtMocHelpers::MethodData<QString(const QString &)>(38, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 11 },
        }}),
        // Method 'toBase64'
        QtMocHelpers::MethodData<QString(const QString &)>(39, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 11 },
        }}),
        // Method 'fromBase64'
        QtMocHelpers::MethodData<QString(const QString &)>(40, 5, QMC::AccessPublic, QMetaType::QString, {{
            { QMetaType::QString, 11 },
        }}),
        // Method 'removeDir'
        QtMocHelpers::MethodData<bool(const QString &)>(41, 5, QMC::AccessPublic, QMetaType::Bool, {{
            { QMetaType::QString, 42 },
        }}),
        // Method 'removeFile'
        QtMocHelpers::MethodData<bool(const QString &)>(43, 5, QMC::AccessPublic, QMetaType::Bool, {{
            { QMetaType::QString, 44 },
        }}),
        // Method 'showFileInFolder'
        QtMocHelpers::MethodData<void(const QString &)>(45, 5, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 33 },
        }}),
        // Method 'isSoftware'
        QtMocHelpers::MethodData<bool()>(46, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'currentTimestamp'
        QtMocHelpers::MethodData<qint64()>(47, 5, QMC::AccessPublic, QMetaType::LongLong),
        // Method 'cursorPos'
        QtMocHelpers::MethodData<QPoint()>(48, 5, QMC::AccessPublic, 0x80000000 | 49),
        // Method 'windowIcon'
        QtMocHelpers::MethodData<QIcon()>(50, 5, QMC::AccessPublic, 0x80000000 | 51),
        // Method 'cursorScreenIndex'
        QtMocHelpers::MethodData<int()>(52, 5, QMC::AccessPublic, QMetaType::Int),
        // Method 'windowBuildNumber'
        QtMocHelpers::MethodData<int()>(53, 5, QMC::AccessPublic, QMetaType::Int),
        // Method 'isWindows11OrGreater'
        QtMocHelpers::MethodData<bool()>(54, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'isWindows10OrGreater'
        QtMocHelpers::MethodData<bool()>(55, 5, QMC::AccessPublic, QMetaType::Bool),
        // Method 'desktopAvailableGeometry'
        QtMocHelpers::MethodData<QRect(QQuickWindow *)>(56, 5, QMC::AccessPublic, 0x80000000 | 30, {{
            { 0x80000000 | 57, 58 },
        }}),
        // Method 'getWallpaperFilePath'
        QtMocHelpers::MethodData<QString()>(59, 5, QMC::AccessPublic, QMetaType::QString),
        // Method 'imageMainColor'
        QtMocHelpers::MethodData<QColor(const QImage &, double)>(60, 5, QMC::AccessPublic, 0x80000000 | 35, {{
            { 0x80000000 | 61, 62 }, { QMetaType::Double, 63 },
        }}),
        // Method 'imageMainColor'
        QtMocHelpers::MethodData<QColor(const QImage &)>(60, 5, QMC::AccessPublic | QMC::MethodCloned, 0x80000000 | 35, {{
            { 0x80000000 | 61, 62 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
            {    2,    3 },
    });
    return QtMocHelpers::metaObjectData<FluTools, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTools::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluToolsE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluToolsE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN8FluToolsE_t>.metaTypes,
    nullptr
} };

void FluTools::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTools *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { int _r = _t->qtMajor();
            if (_a[0]) *reinterpret_cast<int*>(_a[0]) = std::move(_r); }  break;
        case 1: { int _r = _t->qtMinor();
            if (_a[0]) *reinterpret_cast<int*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->isMacos();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->isLinux();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->isWin();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->clipText((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 6: { QString _r = _t->uuid();
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 7: { QString _r = _t->readFile((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 8: _t->setQuitOnLastWindowClosed((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 9: _t->setOverrideCursor((*reinterpret_cast<std::add_pointer_t<Qt::CursorShape>>(_a[1]))); break;
        case 10: _t->restoreOverrideCursor(); break;
        case 11: { QString _r = _t->html2PlantText((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 12: { QString _r = _t->toLocalPath((*reinterpret_cast<std::add_pointer_t<QUrl>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 13: _t->deleteLater((*reinterpret_cast<std::add_pointer_t<QObject*>>(_a[1]))); break;
        case 14: { QString _r = _t->getFileNameByUrl((*reinterpret_cast<std::add_pointer_t<QUrl>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 15: { QRect _r = _t->getVirtualGeometry();
            if (_a[0]) *reinterpret_cast<QRect*>(_a[0]) = std::move(_r); }  break;
        case 16: { QString _r = _t->getApplicationDirPath();
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 17: { QUrl _r = _t->getUrlByFilePath((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QUrl*>(_a[0]) = std::move(_r); }  break;
        case 18: { QColor _r = _t->withOpacity((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<qreal>>(_a[2])));
            if (_a[0]) *reinterpret_cast<QColor*>(_a[0]) = std::move(_r); }  break;
        case 19: { QString _r = _t->md5((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 20: { QString _r = _t->sha256((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 21: { QString _r = _t->toBase64((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 22: { QString _r = _t->fromBase64((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 23: { bool _r = _t->removeDir((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 24: { bool _r = _t->removeFile((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 25: _t->showFileInFolder((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 26: { bool _r = _t->isSoftware();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 27: { qint64 _r = _t->currentTimestamp();
            if (_a[0]) *reinterpret_cast<qint64*>(_a[0]) = std::move(_r); }  break;
        case 28: { QPoint _r = _t->cursorPos();
            if (_a[0]) *reinterpret_cast<QPoint*>(_a[0]) = std::move(_r); }  break;
        case 29: { QIcon _r = _t->windowIcon();
            if (_a[0]) *reinterpret_cast<QIcon*>(_a[0]) = std::move(_r); }  break;
        case 30: { int _r = _t->cursorScreenIndex();
            if (_a[0]) *reinterpret_cast<int*>(_a[0]) = std::move(_r); }  break;
        case 31: { int _r = _t->windowBuildNumber();
            if (_a[0]) *reinterpret_cast<int*>(_a[0]) = std::move(_r); }  break;
        case 32: { bool _r = _t->isWindows11OrGreater();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 33: { bool _r = _t->isWindows10OrGreater();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 34: { QRect _r = _t->desktopAvailableGeometry((*reinterpret_cast<std::add_pointer_t<QQuickWindow*>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QRect*>(_a[0]) = std::move(_r); }  break;
        case 35: { QString _r = _t->getWallpaperFilePath();
            if (_a[0]) *reinterpret_cast<QString*>(_a[0]) = std::move(_r); }  break;
        case 36: { QColor _r = _t->imageMainColor((*reinterpret_cast<std::add_pointer_t<QImage>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2])));
            if (_a[0]) *reinterpret_cast<QColor*>(_a[0]) = std::move(_r); }  break;
        case 37: { QColor _r = _t->imageMainColor((*reinterpret_cast<std::add_pointer_t<QImage>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QColor*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 34:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickWindow* >(); break;
            }
            break;
        }
    }
}

const QMetaObject *FluTools::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTools::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluToolsE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluTools::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 38)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 38;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 38)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 38;
    }
    return _id;
}
QT_WARNING_POP
