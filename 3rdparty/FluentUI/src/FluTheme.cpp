#include "FluTheme.h"

#include <QGuiApplication>
#include <QPalette>
#include <QImage>
#include <QThreadPool>
#include "Def.h"
#include "FluColors.h"
#include "FluTools.h"

bool systemDark() {
    QPalette palette = QGuiApplication::palette();
    QColor color = palette.color(QPalette::Window).rgb();
    return color.red() * 0.2126 + color.green() * 0.7152 + color.blue() * 0.0722 <= 255.0f / 2;
}

FluTheme::FluTheme(QObject *parent) : QObject{parent} {
    _accentColor = FluColors::getInstance()->Blue();
    _darkMode = FluThemeType::DarkMode::Light;
    _nativeText = false;
    _animationEnabled = true;
    _systemDark = systemDark();
    _desktopImagePath = "";
    _blurBehindWindowEnabled = false;
    _enableInputShadow = false;
    QGuiApplication::instance()->installEventFilter(this);

    connect(this, &FluTheme::darkModeChanged, this, [=] { 
        _systemDark = systemDark();
        Q_EMIT darkChanged(); 
    });
    connect(this, &FluTheme::darkChanged, this, [=] { 
        if (_blockSync) return;
        if (_darkMode == FluThemeType::DarkMode::System) {
            if (_theme == "Light" || _theme == "Dark") {
                theme(dark() ? "Dark" : "Light"); 
            }
        }
        refreshColors(); 
    });
    connect(this, &FluTheme::accentColorChanged, this, [=] { 
        initThemes();
        refreshColors(); 
    });
    connect(this, &FluTheme::themeChanged, this, [=] {
        if (_blockSync) return;
        refreshColors();
    });
    connect(&_watcher, &QFileSystemWatcher::fileChanged, this,
            [=](const QString &path) { Q_EMIT desktopImagePathChanged(); });
    connect(this, &FluTheme::blurBehindWindowEnabledChanged, this,
            [=] { checkUpdateDesktopImage(); });

    initThemes();
    theme("Blue");
    
    startTimer(1000);
}

void FluTheme::refreshColors() {
    auto isDark = dark();
    if(!_themes.contains(_theme)) return;
    const auto& map = _themes[_theme];
#define REFRESH_COLOR(M) if(map.contains(#M)) M(map[#M])
    REFRESH_COLOR(backgroundColor);
    REFRESH_COLOR(backgroundDisableColor);
    REFRESH_COLOR(backgroundHoverColor);
    REFRESH_COLOR(backgroundNormalColor);
    REFRESH_COLOR(backgroundPressedColor);
    REFRESH_COLOR(blackColor);
    REFRESH_COLOR(whiteColor);
    REFRESH_COLOR(borderCheckColor);
    REFRESH_COLOR(bordercheckedColor);
    REFRESH_COLOR(borderColor);
    REFRESH_COLOR(borderDisableColor);
    REFRESH_COLOR(borderHoverColor);
    REFRESH_COLOR(borderNormalColor);
    REFRESH_COLOR(borderPressedColor);
    REFRESH_COLOR(borerlessColor);
    REFRESH_COLOR(checkColor);
    REFRESH_COLOR(checkedColor);
    REFRESH_COLOR(checkedDisableColor);
    REFRESH_COLOR(checkedHoverColor);
    REFRESH_COLOR(checkedPreesedColor);
    REFRESH_COLOR(closeHoverColor);
    REFRESH_COLOR(closeNormalColor);
    REFRESH_COLOR(closePressColor);
    REFRESH_COLOR(disableColor);
    REFRESH_COLOR(dividerColor);
    REFRESH_COLOR(dotCheckColor);
    REFRESH_COLOR(dotDisableColor);
    REFRESH_COLOR(dotNormalColor);
    REFRESH_COLOR(endColor);
    REFRESH_COLOR(startColor);
    REFRESH_COLOR(errorColor);
    REFRESH_COLOR(handleColor);
    REFRESH_COLOR(hoverColor);
    REFRESH_COLOR(hueColor);
    REFRESH_COLOR(iconColor);
    REFRESH_COLOR(itemDisableColor);
    REFRESH_COLOR(lineColor);
    REFRESH_COLOR(maximizeHoverColor);
    REFRESH_COLOR(maximizeNormalColor);
    REFRESH_COLOR(maximizePressColor);
    REFRESH_COLOR(minimizeHoverColor);
    REFRESH_COLOR(minimizeNormalColor);
    REFRESH_COLOR(minimizePressColor);
    REFRESH_COLOR(normalColor);
    REFRESH_COLOR(opacityColor);
    REFRESH_COLOR(placeholderDisableColor);
    REFRESH_COLOR(placeholderFocusColor);
    REFRESH_COLOR(placeholderNormalColor);
    REFRESH_COLOR(pressedColor);
    REFRESH_COLOR(resizeBorderColor);
    REFRESH_COLOR(selectedBorderColor);
    REFRESH_COLOR(selectedColor);
    REFRESH_COLOR(selectedTextColor);
    REFRESH_COLOR(strokeColor);
    REFRESH_COLOR(textColor);
    REFRESH_COLOR(textHighlightColor);
    REFRESH_COLOR(textHoverColor);
    REFRESH_COLOR(textNormalColor);
    REFRESH_COLOR(textDisableColor);
    REFRESH_COLOR(headerNormalColor);
    REFRESH_COLOR(headerHoverColor);
    REFRESH_COLOR(itemHoverColor);
    REFRESH_COLOR(itemNormalColor);
    REFRESH_COLOR(windowBackgroundColor);
    REFRESH_COLOR(windowActiveBackgroundColor);
    REFRESH_COLOR(tintColor);
    REFRESH_COLOR(controlNormalColor);
    REFRESH_COLOR(frameColor);
    REFRESH_COLOR(frameActiveColor);
#undef REFRESH_COLOR
    // Legacy mapping (to keep existing components working)
    primaryColor(isDark ? _accentColor->lighter() : _accentColor->dark());
    fontPrimaryColor(isDark ? QColor(248, 248, 248, 255) : QColor(7, 7, 7, 255));
    fontSecondaryColor(isDark ? QColor(222, 222, 222, 255) : QColor(102, 102, 102, 255));
    fontTertiaryColor(isDark ? QColor(200, 200, 200, 255) : QColor(153, 153, 153, 255));
    itemPressColor(isDark ? QColor(255, 255, 255, qRound(255 * 0.09)) : QColor(0, 0, 0, qRound(255 * 0.06)));
    itemCheckColor(isDark ? QColor(255, 255, 255, qRound(255 * 0.12)) : QColor(0, 0, 0, qRound(255 * 0.09)));
}

void FluTheme::initThemes() {
    auto primaryColor = _accentColor->normal();
    auto colors = FluColors::getInstance();
    QMap<QString, QColor> dark_colors, light_colors, blue_colors, green_colors;
    
    // === LIGHT THEME ===
    light_colors["backgroundColor"] = QColor(214, 214, 214, 255);
    light_colors["backgroundDisableColor"] = QColor(0,0,0,0);
    light_colors["backgroundHoverColor"] = QColor(0,0,0, qRound(255*0.03));
    light_colors["backgroundNormalColor"] = QColor(0,0,0,0);
    light_colors["backgroundPressedColor"] = QColor(0,0,0, qRound(255*0.06));
    light_colors["blackColor"] = QColor(0, 0, 0, 255);
    light_colors["whiteColor"] = QColor(255, 255, 255, 255);
    light_colors["normalColor"] = QColor(254, 254, 254, 255);
    light_colors["hoverColor"] = QColor(246, 246, 246, 255);
    light_colors["pressedColor"] = QColor(216, 216, 216, 255);
    light_colors["disableColor"] = QColor(251, 251, 251, 255);
    light_colors["borderColor"] = QColor(228, 228, 228, 255);
    light_colors["borderNormalColor"] = QColor(141, 141, 141, 255);
    light_colors["borderHoverColor"] = QColor(135, 135, 135, 255);
    light_colors["borderPressedColor"] = QColor(191, 191, 191, 255);
    light_colors["borderDisableColor"] = QColor(199, 199, 199, 255);
    light_colors["borderCheckColor"] = primaryColor;
    light_colors["bordercheckedColor"] = primaryColor;
    light_colors["borerlessColor"] = primaryColor;
    light_colors["resizeBorderColor"] = QColor(0, 0, 0, 25);
    light_colors["checkColor"] = primaryColor;
    light_colors["checkedColor"] = primaryColor;
    light_colors["checkedDisableColor"] = QColor(199, 199, 199, 255);
    light_colors["checkedHoverColor"] = primaryColor.lighter(115);
    light_colors["checkedPreesedColor"] = primaryColor.lighter(130);
    light_colors["textColor"] = QColor(7, 7, 7, 255);
    light_colors["textNormalColor"] = colors->Grey120();
    light_colors["textHoverColor"] = colors->Grey150();
    light_colors["textHighlightColor"] = colors->Black();
    light_colors["placeholderNormalColor"] = QColor(96, 96, 96, 255);
    light_colors["placeholderFocusColor"] = QColor(141, 141, 141, 255);
    light_colors["placeholderDisableColor"] = QColor(160, 160, 160, 255);
    light_colors["closeNormalColor"] = QColor(0, 0, 0, 0);
    light_colors["closeHoverColor"] = QColor(251, 115, 115, 255);
    light_colors["closePressColor"] = QColor(251, 115, 115, 204);
    light_colors["maximizeNormalColor"] = QColor(0,0,0,0);
    light_colors["maximizeHoverColor"] = QColor(0,0,0, qRound(255*0.03));
    light_colors["maximizePressColor"] = QColor(0,0,0, qRound(255*0.06));
    light_colors["minimizeNormalColor"] = QColor(0,0,0,0);
    light_colors["minimizeHoverColor"] = QColor(0,0,0, qRound(255*0.03));
    light_colors["minimizePressColor"] = QColor(0,0,0, qRound(255*0.06));
    light_colors["dotNormalColor"] = QColor(93, 93, 93, 255);
    light_colors["dotCheckColor"] = QColor(255, 255, 255, 255);
    light_colors["dotDisableColor"] = QColor(150, 150, 150, 255);
    light_colors["startColor"] = QColor(232, 232, 232, 255);
    light_colors["endColor"] = QColor(232, 232, 232, 255);
    light_colors["errorColor"] = QColor(250, 85, 85, 255);
    light_colors["handleColor"] = QColor(138, 138, 138, 255);
    light_colors["hueColor"] = QColor(0,0,0,0);
    light_colors["iconColor"] = QColor(7,7,7,255);
    light_colors["itemDisableColor"] = QColor(160, 160, 160, 255);
    light_colors["lineColor"] = QColor(210, 210, 210, 255);
    light_colors["dividerColor"] = QColor(233, 233, 233, 255);
    light_colors["opacityColor"] = QColor(0,0,0,0);
    light_colors["selectedBorderColor"] = primaryColor;
    light_colors["selectedColor"] = QColor(primaryColor.red(), primaryColor.green(), primaryColor.blue(), 76);
    light_colors["selectedTextColor"] = colors->Grey120();
    light_colors["headerNormalColor"] = QColor(246, 246, 246, 255);
    light_colors["headerHoverColor"] = QColor(235, 235, 235, 255);
    light_colors["itemHoverColor"] = QColor(0, 0, 0, qRound(255 * 0.03));
    light_colors["itemNormalColor"] = QColor(0, 0, 0, qRound(255 * 0.015));
    light_colors["textDisableColor"] = QColor(134, 134, 134, 255);
    light_colors["strokeColor"] = QColor(255,255,255,255);
    light_colors["tintColor"] = QColor(255, 255, 255, 255);
    light_colors["windowBackgroundColor"] = QColor(243, 243, 243, 255);
    light_colors["windowActiveBackgroundColor"] = QColor(252, 252, 252, 255);
    light_colors["controlNormalColor"] = QColor(254, 254, 254, 255);
    light_colors["frameColor"] = QColor(255, 255, 255, 255);
    light_colors["frameActiveColor"] = QColor(250, 250, 250, 255);

    // === DARK THEME ===
    dark_colors = light_colors; 
    dark_colors["backgroundColor"] = QColor(99, 99, 99, 255);
    dark_colors["backgroundDisableColor"] = QColor(255,255,255,0);
    dark_colors["backgroundHoverColor"] = QColor(255,255,255, qRound(255*0.06));
    dark_colors["backgroundNormalColor"] = QColor(255,255,255,0);
    dark_colors["backgroundPressedColor"] = QColor(255,255,255, qRound(255*0.09));
    dark_colors["normalColor"] = QColor(62, 62, 62, 255);
    dark_colors["hoverColor"] = QColor(68, 68, 68, 255);
    dark_colors["pressedColor"] = QColor(72, 72, 72, 255);
    dark_colors["disableColor"] = QColor(59, 59, 59, 255);
    dark_colors["borderColor"] = QColor(37, 37, 37, 255);
    dark_colors["borderNormalColor"] = QColor(161, 161, 161, 255);
    dark_colors["borderHoverColor"] = QColor(167, 167, 167, 255);
    dark_colors["borderPressedColor"] = QColor(90, 90, 90, 255);
    dark_colors["borderDisableColor"] = QColor(82, 82, 82, 255);
    dark_colors["resizeBorderColor"] = QColor(255, 255, 255, 25);
    dark_colors["checkedDisableColor"] = QColor(82, 82, 82, 255);
    dark_colors["checkedHoverColor"] = primaryColor.darker(115);
    dark_colors["checkedPreesedColor"] = primaryColor.darker(130);
    dark_colors["textColor"] = QColor(248, 248, 248, 255);
    dark_colors["textHoverColor"] = colors->Grey80();
    dark_colors["textHighlightColor"] = colors->Grey10();
    dark_colors["placeholderNormalColor"] = QColor(210, 210, 210, 255);
    dark_colors["placeholderFocusColor"] = QColor(152, 152, 152, 255);
    dark_colors["placeholderDisableColor"] = QColor(131, 131, 131, 255);
    dark_colors["maximizeHoverColor"] = QColor(255,255,255, qRound(255*0.06));
    dark_colors["maximizePressColor"] = QColor(255,255,255, qRound(255*0.09));
    dark_colors["minimizeHoverColor"] = QColor(255,255,255, qRound(255*0.06));
    dark_colors["minimizePressColor"] = QColor(255,255,255, qRound(255*0.09));
    dark_colors["dotNormalColor"] = QColor(208, 208, 208, 255);
    dark_colors["dotCheckColor"] = QColor(0, 0, 0, 255);
    dark_colors["dotDisableColor"] = QColor(50, 50, 50, 255);
    dark_colors["startColor"] = QColor(66, 66, 66, 255);
    dark_colors["endColor"] = QColor(66, 66, 66, 255);
    dark_colors["itemHoverColor"] = QColor(255, 255, 255, qRound(255 * 0.06));
    dark_colors["itemNormalColor"] = QColor(255, 255, 255, qRound(255 * 0.03));
    dark_colors["textDisableColor"] = QColor(150, 150, 150, 255);
    dark_colors["handleColor"] = QColor(159, 159, 159, 255);
    dark_colors["iconColor"] = QColor(248,248,248,255);
    dark_colors["itemDisableColor"] = QColor(131, 131, 131, 255);
    dark_colors["lineColor"] = QColor(80, 80, 80, 255);
    dark_colors["dividerColor"] = QColor(80, 80, 80, 255);
    dark_colors["opacityColor"] = QColor(0,0,0,0);
    dark_colors["selectedBorderColor"] = primaryColor;
    dark_colors["selectedColor"] = QColor(primaryColor.red(), primaryColor.green(), primaryColor.blue(), 76);
    dark_colors["selectedTextColor"] = QColor(255, 255, 255, 255);
    dark_colors["headerNormalColor"] = QColor(50, 50, 50, 255);
    dark_colors["headerHoverColor"] = QColor(60, 60, 60, 255);
    dark_colors["strokeColor"] = QColor(0,0,0,255);
    dark_colors["windowBackgroundColor"] = QColor(32, 32, 32, 255);
    dark_colors["windowActiveBackgroundColor"] = QColor(43, 43, 43, 255);
    dark_colors["controlNormalColor"] = QColor(62, 62, 62, 255);
    dark_colors["frameColor"] = QColor(43, 43, 43, 255);
    dark_colors["frameActiveColor"] = QColor(32, 32, 32, 255);

    // === BLUE THEME (Elegance) ===
    blue_colors = light_colors;
    blue_colors["backgroundColor"] = QColor(230, 240, 250, 255);
    blue_colors["normalColor"] = QColor(215, 230, 245, 255);
    blue_colors["hoverColor"] = QColor(200, 220, 240, 255);
    blue_colors["pressedColor"] = QColor(185, 210, 235, 255);
    blue_colors["borderColor"] = QColor(160, 190, 225, 255);
    blue_colors["borderNormalColor"] = QColor(150, 180, 220, 255);
    blue_colors["windowBackgroundColor"] = QColor(238, 244, 250, 255);
    blue_colors["windowActiveBackgroundColor"] = QColor(245, 250, 255, 255);
    blue_colors["headerNormalColor"] = QColor(220, 235, 250, 255);
    blue_colors["headerHoverColor"] = QColor(210, 225, 245, 255);
    blue_colors["frameColor"] = QColor(245, 250, 255, 255);
    blue_colors["frameActiveColor"] = QColor(235, 245, 255, 255);

    // === GREEN THEME (Nature) ===
    green_colors = light_colors;
    green_colors["backgroundColor"] = QColor(230, 245, 235, 255);
    green_colors["normalColor"] = QColor(215, 240, 225, 255);
    green_colors["hoverColor"] = QColor(200, 230, 215, 255);
    green_colors["pressedColor"] = QColor(185, 220, 205, 255);
    green_colors["borderColor"] = QColor(160, 210, 185, 255);
    green_colors["borderNormalColor"] = QColor(150, 200, 175, 255);
    green_colors["windowBackgroundColor"] = QColor(240, 250, 242, 255);
    green_colors["windowActiveBackgroundColor"] = QColor(248, 252, 249, 255);
    green_colors["headerNormalColor"] = QColor(225, 240, 230, 255);
    green_colors["headerHoverColor"] = QColor(215, 235, 220, 255);
    green_colors["frameColor"] = QColor(248, 252, 249, 255);
    green_colors["frameActiveColor"] = QColor(240, 250, 242, 255);

    _themes["Light"] = light_colors;
    _themes["Dark"] = dark_colors;
    _themes["Blue"] = blue_colors;
    _themes["Green"] = green_colors;
}

bool FluTheme::eventFilter(QObject *, QEvent *event) {
    if (event->type() == QEvent::ApplicationPaletteChange || event->type() == QEvent::ThemeChange) {
        _systemDark = systemDark();
        Q_EMIT darkChanged();
        event->accept();
        return true;
    }
    return false;
}

bool FluTheme::dark() const {
    if (_darkMode == FluThemeType::DarkMode::Dark) {
        return true;
    } else if (_darkMode == FluThemeType::DarkMode::System) {
        return _systemDark;
    } else {
        return false;
    }
}

void FluTheme::checkUpdateDesktopImage() {
    if (!_blurBehindWindowEnabled) {

        return;
    }
    QThreadPool::globalInstance()->start([=]() {
        _mutex.lock();
        auto path = FluTools::getInstance()->getWallpaperFilePath();
        if (_desktopImagePath != path) {
            if (!_desktopImagePath.isEmpty()) {
                _watcher.removePath(_desktopImagePath);
            }
            desktopImagePath(path);
            _watcher.addPath(path);
        }
        _mutex.unlock();
    });
}

void FluTheme::timerEvent(QTimerEvent *event) {
    checkUpdateDesktopImage();
}
void FluTheme::nextTheme() {
    QStringList themes = {"Dark", "Blue", "Green"};
    int idx = themes.indexOf(_theme);
    if (idx == -1) idx = 0;
    idx = (idx + 1) % themes.size();
    QString nTheme = themes[idx];
    
    // 终极修复：启用同步封锁块
    _blockSync = true;
    _theme = nTheme;
    if (nTheme == "Dark") {
        _darkMode = FluThemeType::DarkMode::Dark;
    } else {
        _darkMode = FluThemeType::DarkMode::Light;
    }
    
    // 仅执行一次全色刷新
    refreshColors();
    
    // 原子化触发信号
    Q_EMIT themeChanged();
    Q_EMIT darkModeChanged();
    
    _blockSync = false;
}
