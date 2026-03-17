#pragma once

#include <QObject>
#include <QtQml/qqml.h>
#include <QJsonArray>
#include <QJsonObject>
#include <QColor>
#include <QTimer>
#include <QFileSystemWatcher>
#include <QMutex>
#include <QMap>
#include "FluAccentColor.h"
#include "stdafx.h"
#include "singleton.h"

/**
 * @brief The FluTheme class
 */
class FluTheme : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool dark READ dark NOTIFY darkChanged)
    Q_PROPERTY_AUTO_P(FluAccentColor *, accentColor)
    Q_PROPERTY_AUTO(QString, theme) 
    Q_PROPERTY_AUTO(QColor, primaryColor)
    Q_PROPERTY_AUTO(QColor, backgroundColor)
    Q_PROPERTY_AUTO(QColor, backgroundDisableColor)
    Q_PROPERTY_AUTO(QColor, backgroundHoverColor)
    Q_PROPERTY_AUTO(QColor, backgroundNormalColor)
    Q_PROPERTY_AUTO(QColor, backgroundPressedColor)
    Q_PROPERTY_AUTO(QColor, blackColor)
    Q_PROPERTY_AUTO(QColor, whiteColor)
    Q_PROPERTY_AUTO(QColor, borderCheckColor)
    Q_PROPERTY_AUTO(QColor, bordercheckedColor)
    Q_PROPERTY_AUTO(QColor, borderColor)
    Q_PROPERTY_AUTO(QColor, borderDisableColor)
    Q_PROPERTY_AUTO(QColor, borderHoverColor)
    Q_PROPERTY_AUTO(QColor, borderNormalColor)
    Q_PROPERTY_AUTO(QColor, borderPressedColor)
    Q_PROPERTY_AUTO(QColor, borerlessColor)
    Q_PROPERTY_AUTO(QColor, checkColor)
    Q_PROPERTY_AUTO(QColor, checkedColor)
    Q_PROPERTY_AUTO(QColor, checkedDisableColor)
    Q_PROPERTY_AUTO(QColor, checkedHoverColor)
    Q_PROPERTY_AUTO(QColor, checkedPreesedColor)
    Q_PROPERTY_AUTO(QColor, closeHoverColor)
    Q_PROPERTY_AUTO(QColor, closeNormalColor)
    Q_PROPERTY_AUTO(QColor, closePressColor)
    Q_PROPERTY_AUTO(QColor, maximizeHoverColor)
    Q_PROPERTY_AUTO(QColor, maximizeNormalColor)
    Q_PROPERTY_AUTO(QColor, maximizePressColor)
    Q_PROPERTY_AUTO(QColor, minimizeHoverColor)
    Q_PROPERTY_AUTO(QColor, minimizeNormalColor)
    Q_PROPERTY_AUTO(QColor, minimizePressColor)
    Q_PROPERTY_AUTO(QColor, disableColor)
    Q_PROPERTY_AUTO(QColor, dividerColor)
    Q_PROPERTY_AUTO(QColor, errorColor)
    Q_PROPERTY_AUTO(QColor, opacityColor)
    Q_PROPERTY_AUTO(QColor, hueColor)
    Q_PROPERTY_AUTO(QColor, dotCheckColor)
    Q_PROPERTY_AUTO(QColor, dotDisableColor)
    Q_PROPERTY_AUTO(QColor, dotNormalColor)
    Q_PROPERTY_AUTO(QColor, endColor)
    Q_PROPERTY_AUTO(QColor, startColor)
    Q_PROPERTY_AUTO(QColor, handleColor)
    Q_PROPERTY_AUTO(QColor, lineColor)
    Q_PROPERTY_AUTO(QColor, hoverColor)
    Q_PROPERTY_AUTO(QColor, pressedColor)
    Q_PROPERTY_AUTO(QColor, normalColor)
    Q_PROPERTY_AUTO(QColor, iconColor)
    Q_PROPERTY_AUTO(QColor, itemDisableColor)
    Q_PROPERTY_AUTO(QColor, itemHoverColor)
    Q_PROPERTY_AUTO(QColor, itemNormalColor)
    Q_PROPERTY_AUTO(QColor, headerNormalColor)
    Q_PROPERTY_AUTO(QColor, headerHoverColor)
    Q_PROPERTY_AUTO(QColor, selectedColor)
    Q_PROPERTY_AUTO(QColor, selectedBorderColor)
    Q_PROPERTY_AUTO(QColor, selectedTextColor)
    Q_PROPERTY_AUTO(QColor, placeholderDisableColor)
    Q_PROPERTY_AUTO(QColor, placeholderFocusColor)
    Q_PROPERTY_AUTO(QColor, placeholderNormalColor)
    Q_PROPERTY_AUTO(QColor, textColor)
    Q_PROPERTY_AUTO(QColor, textHighlightColor)
    Q_PROPERTY_AUTO(QColor, textHoverColor)
    Q_PROPERTY_AUTO(QColor, textNormalColor)
    Q_PROPERTY_AUTO(QColor, textDisableColor)
    Q_PROPERTY_AUTO(QColor, strokeColor)
    Q_PROPERTY_AUTO(QColor, windowBackgroundColor)
    Q_PROPERTY_AUTO(QColor, windowActiveBackgroundColor)
    Q_PROPERTY_AUTO(QColor, tintColor)
    Q_PROPERTY_AUTO(QColor, controlNormalColor)
    Q_PROPERTY_AUTO(QColor, resizeBorderColor)
    Q_PROPERTY_AUTO(QColor, frameColor)
    Q_PROPERTY_AUTO(QColor, frameActiveColor)
    Q_PROPERTY_AUTO(QColor, fontPrimaryColor)
    Q_PROPERTY_AUTO(QColor, fontSecondaryColor)
    Q_PROPERTY_AUTO(QColor, fontTertiaryColor)
    Q_PROPERTY_AUTO(QColor, itemPressColor)
    Q_PROPERTY_AUTO(QColor, itemCheckColor)
    Q_PROPERTY_AUTO(QString, desktopImagePath)
    Q_PROPERTY_AUTO(int, darkMode)
    Q_PROPERTY_AUTO(bool, nativeText)
    Q_PROPERTY_AUTO(bool, animationEnabled)
    Q_PROPERTY_AUTO(bool, blurBehindWindowEnabled)
    QML_NAMED_ELEMENT(FluTheme)
    QML_SINGLETON

private:
    explicit FluTheme(QObject *parent = nullptr);

    bool eventFilter(QObject *obj, QEvent *event) override;

    Q_INVOKABLE void refreshColors();
    Q_INVOKABLE void initThemes();

protected:
    void timerEvent(QTimerEvent *event) override;

    void checkUpdateDesktopImage();

public:
    SINGLETON(FluTheme)

    Q_SIGNAL void darkChanged();

    static FluTheme *create(QQmlEngine *, QJSEngine *) {
        return getInstance();
    }

    bool dark() const;

private:
    bool _systemDark;
    QFileSystemWatcher _watcher;
    QMutex _mutex;
    QMap<QString, QMap<QString, QColor>> _themes;
};
