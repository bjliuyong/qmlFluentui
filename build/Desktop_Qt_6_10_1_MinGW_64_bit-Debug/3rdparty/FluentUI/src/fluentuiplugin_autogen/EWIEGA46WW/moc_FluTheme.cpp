/****************************************************************************
** Meta object code from reading C++ file 'FluTheme.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTheme.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTheme.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN8FluThemeE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTheme::qt_create_metaobjectdata<qt_meta_tag_ZN8FluThemeE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTheme",
        "QML.Element",
        "QML.Singleton",
        "true",
        "accentColorChanged",
        "",
        "primaryColorChanged",
        "backgroundColorChanged",
        "dividerColorChanged",
        "windowBackgroundColorChanged",
        "windowActiveBackgroundColorChanged",
        "fontPrimaryColorChanged",
        "fontSecondaryColorChanged",
        "fontTertiaryColorChanged",
        "itemNormalColorChanged",
        "frameColorChanged",
        "frameActiveColorChanged",
        "itemHoverColorChanged",
        "itemPressColorChanged",
        "itemCheckColorChanged",
        "desktopImagePathChanged",
        "darkModeChanged",
        "nativeTextChanged",
        "animationEnabledChanged",
        "blurBehindWindowEnabledChanged",
        "darkChanged",
        "dark",
        "accentColor",
        "FluAccentColor*",
        "primaryColor",
        "QColor",
        "backgroundColor",
        "dividerColor",
        "windowBackgroundColor",
        "windowActiveBackgroundColor",
        "fontPrimaryColor",
        "fontSecondaryColor",
        "fontTertiaryColor",
        "itemNormalColor",
        "frameColor",
        "frameActiveColor",
        "itemHoverColor",
        "itemPressColor",
        "itemCheckColor",
        "desktopImagePath",
        "darkMode",
        "nativeText",
        "animationEnabled",
        "blurBehindWindowEnabled"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'accentColorChanged'
        QtMocHelpers::SignalData<void()>(4, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'primaryColorChanged'
        QtMocHelpers::SignalData<void()>(6, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'backgroundColorChanged'
        QtMocHelpers::SignalData<void()>(7, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'dividerColorChanged'
        QtMocHelpers::SignalData<void()>(8, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'windowBackgroundColorChanged'
        QtMocHelpers::SignalData<void()>(9, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'windowActiveBackgroundColorChanged'
        QtMocHelpers::SignalData<void()>(10, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fontPrimaryColorChanged'
        QtMocHelpers::SignalData<void()>(11, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fontSecondaryColorChanged'
        QtMocHelpers::SignalData<void()>(12, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fontTertiaryColorChanged'
        QtMocHelpers::SignalData<void()>(13, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'itemNormalColorChanged'
        QtMocHelpers::SignalData<void()>(14, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'frameColorChanged'
        QtMocHelpers::SignalData<void()>(15, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'frameActiveColorChanged'
        QtMocHelpers::SignalData<void()>(16, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'itemHoverColorChanged'
        QtMocHelpers::SignalData<void()>(17, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'itemPressColorChanged'
        QtMocHelpers::SignalData<void()>(18, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'itemCheckColorChanged'
        QtMocHelpers::SignalData<void()>(19, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'desktopImagePathChanged'
        QtMocHelpers::SignalData<void()>(20, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'darkModeChanged'
        QtMocHelpers::SignalData<void()>(21, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'nativeTextChanged'
        QtMocHelpers::SignalData<void()>(22, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'animationEnabledChanged'
        QtMocHelpers::SignalData<void()>(23, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'blurBehindWindowEnabledChanged'
        QtMocHelpers::SignalData<void()>(24, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'darkChanged'
        QtMocHelpers::SignalData<void()>(25, 5, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'dark'
        QtMocHelpers::PropertyData<bool>(26, QMetaType::Bool, QMC::DefaultPropertyFlags, 20),
        // property 'accentColor'
        QtMocHelpers::PropertyData<FluAccentColor*>(27, 0x80000000 | 28, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'primaryColor'
        QtMocHelpers::PropertyData<QColor>(29, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'backgroundColor'
        QtMocHelpers::PropertyData<QColor>(31, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'dividerColor'
        QtMocHelpers::PropertyData<QColor>(32, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'windowBackgroundColor'
        QtMocHelpers::PropertyData<QColor>(33, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'windowActiveBackgroundColor'
        QtMocHelpers::PropertyData<QColor>(34, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
        // property 'fontPrimaryColor'
        QtMocHelpers::PropertyData<QColor>(35, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 6),
        // property 'fontSecondaryColor'
        QtMocHelpers::PropertyData<QColor>(36, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 7),
        // property 'fontTertiaryColor'
        QtMocHelpers::PropertyData<QColor>(37, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 8),
        // property 'itemNormalColor'
        QtMocHelpers::PropertyData<QColor>(38, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 9),
        // property 'frameColor'
        QtMocHelpers::PropertyData<QColor>(39, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 10),
        // property 'frameActiveColor'
        QtMocHelpers::PropertyData<QColor>(40, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 11),
        // property 'itemHoverColor'
        QtMocHelpers::PropertyData<QColor>(41, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 12),
        // property 'itemPressColor'
        QtMocHelpers::PropertyData<QColor>(42, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 13),
        // property 'itemCheckColor'
        QtMocHelpers::PropertyData<QColor>(43, 0x80000000 | 30, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 14),
        // property 'desktopImagePath'
        QtMocHelpers::PropertyData<QString>(44, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 15),
        // property 'darkMode'
        QtMocHelpers::PropertyData<int>(45, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 16),
        // property 'nativeText'
        QtMocHelpers::PropertyData<bool>(46, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 17),
        // property 'animationEnabled'
        QtMocHelpers::PropertyData<bool>(47, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 18),
        // property 'blurBehindWindowEnabled'
        QtMocHelpers::PropertyData<bool>(48, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 19),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
            {    2,    3 },
    });
    return QtMocHelpers::metaObjectData<FluTheme, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTheme::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluThemeE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluThemeE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN8FluThemeE_t>.metaTypes,
    nullptr
} };

void FluTheme::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTheme *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->accentColorChanged(); break;
        case 1: _t->primaryColorChanged(); break;
        case 2: _t->backgroundColorChanged(); break;
        case 3: _t->dividerColorChanged(); break;
        case 4: _t->windowBackgroundColorChanged(); break;
        case 5: _t->windowActiveBackgroundColorChanged(); break;
        case 6: _t->fontPrimaryColorChanged(); break;
        case 7: _t->fontSecondaryColorChanged(); break;
        case 8: _t->fontTertiaryColorChanged(); break;
        case 9: _t->itemNormalColorChanged(); break;
        case 10: _t->frameColorChanged(); break;
        case 11: _t->frameActiveColorChanged(); break;
        case 12: _t->itemHoverColorChanged(); break;
        case 13: _t->itemPressColorChanged(); break;
        case 14: _t->itemCheckColorChanged(); break;
        case 15: _t->desktopImagePathChanged(); break;
        case 16: _t->darkModeChanged(); break;
        case 17: _t->nativeTextChanged(); break;
        case 18: _t->animationEnabledChanged(); break;
        case 19: _t->blurBehindWindowEnabledChanged(); break;
        case 20: _t->darkChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::accentColorChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::primaryColorChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::backgroundColorChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::dividerColorChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::windowBackgroundColorChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::windowActiveBackgroundColorChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::fontPrimaryColorChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::fontSecondaryColorChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::fontTertiaryColorChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::itemNormalColorChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::frameColorChanged, 10))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::frameActiveColorChanged, 11))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::itemHoverColorChanged, 12))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::itemPressColorChanged, 13))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::itemCheckColorChanged, 14))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::desktopImagePathChanged, 15))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::darkModeChanged, 16))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::nativeTextChanged, 17))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::animationEnabledChanged, 18))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::blurBehindWindowEnabledChanged, 19))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTheme::*)()>(_a, &FluTheme::darkChanged, 20))
            return;
    }
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< FluAccentColor* >(); break;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->dark(); break;
        case 1: *reinterpret_cast<FluAccentColor**>(_v) = _t->_accentColor; break;
        case 2: *reinterpret_cast<QColor*>(_v) = _t->_primaryColor; break;
        case 3: *reinterpret_cast<QColor*>(_v) = _t->_backgroundColor; break;
        case 4: *reinterpret_cast<QColor*>(_v) = _t->_dividerColor; break;
        case 5: *reinterpret_cast<QColor*>(_v) = _t->_windowBackgroundColor; break;
        case 6: *reinterpret_cast<QColor*>(_v) = _t->_windowActiveBackgroundColor; break;
        case 7: *reinterpret_cast<QColor*>(_v) = _t->_fontPrimaryColor; break;
        case 8: *reinterpret_cast<QColor*>(_v) = _t->_fontSecondaryColor; break;
        case 9: *reinterpret_cast<QColor*>(_v) = _t->_fontTertiaryColor; break;
        case 10: *reinterpret_cast<QColor*>(_v) = _t->_itemNormalColor; break;
        case 11: *reinterpret_cast<QColor*>(_v) = _t->_frameColor; break;
        case 12: *reinterpret_cast<QColor*>(_v) = _t->_frameActiveColor; break;
        case 13: *reinterpret_cast<QColor*>(_v) = _t->_itemHoverColor; break;
        case 14: *reinterpret_cast<QColor*>(_v) = _t->_itemPressColor; break;
        case 15: *reinterpret_cast<QColor*>(_v) = _t->_itemCheckColor; break;
        case 16: *reinterpret_cast<QString*>(_v) = _t->_desktopImagePath; break;
        case 17: *reinterpret_cast<int*>(_v) = _t->_darkMode; break;
        case 18: *reinterpret_cast<bool*>(_v) = _t->_nativeText; break;
        case 19: *reinterpret_cast<bool*>(_v) = _t->_animationEnabled; break;
        case 20: *reinterpret_cast<bool*>(_v) = _t->_blurBehindWindowEnabled; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 1:
            if (QtMocHelpers::setProperty(_t->_accentColor, *reinterpret_cast<FluAccentColor**>(_v)))
                Q_EMIT _t->accentColorChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_primaryColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->primaryColorChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_backgroundColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->backgroundColorChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_dividerColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->dividerColorChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_windowBackgroundColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->windowBackgroundColorChanged();
            break;
        case 6:
            if (QtMocHelpers::setProperty(_t->_windowActiveBackgroundColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->windowActiveBackgroundColorChanged();
            break;
        case 7:
            if (QtMocHelpers::setProperty(_t->_fontPrimaryColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->fontPrimaryColorChanged();
            break;
        case 8:
            if (QtMocHelpers::setProperty(_t->_fontSecondaryColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->fontSecondaryColorChanged();
            break;
        case 9:
            if (QtMocHelpers::setProperty(_t->_fontTertiaryColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->fontTertiaryColorChanged();
            break;
        case 10:
            if (QtMocHelpers::setProperty(_t->_itemNormalColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->itemNormalColorChanged();
            break;
        case 11:
            if (QtMocHelpers::setProperty(_t->_frameColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->frameColorChanged();
            break;
        case 12:
            if (QtMocHelpers::setProperty(_t->_frameActiveColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->frameActiveColorChanged();
            break;
        case 13:
            if (QtMocHelpers::setProperty(_t->_itemHoverColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->itemHoverColorChanged();
            break;
        case 14:
            if (QtMocHelpers::setProperty(_t->_itemPressColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->itemPressColorChanged();
            break;
        case 15:
            if (QtMocHelpers::setProperty(_t->_itemCheckColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->itemCheckColorChanged();
            break;
        case 16:
            if (QtMocHelpers::setProperty(_t->_desktopImagePath, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->desktopImagePathChanged();
            break;
        case 17:
            if (QtMocHelpers::setProperty(_t->_darkMode, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->darkModeChanged();
            break;
        case 18:
            if (QtMocHelpers::setProperty(_t->_nativeText, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->nativeTextChanged();
            break;
        case 19:
            if (QtMocHelpers::setProperty(_t->_animationEnabled, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->animationEnabledChanged();
            break;
        case 20:
            if (QtMocHelpers::setProperty(_t->_blurBehindWindowEnabled, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->blurBehindWindowEnabledChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluTheme::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTheme::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN8FluThemeE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluTheme::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 21)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 21)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 21;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 21;
    }
    return _id;
}

// SIGNAL 0
void FluTheme::accentColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluTheme::primaryColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluTheme::backgroundColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluTheme::dividerColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluTheme::windowBackgroundColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluTheme::windowActiveBackgroundColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluTheme::fontPrimaryColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void FluTheme::fontSecondaryColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void FluTheme::fontTertiaryColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void FluTheme::itemNormalColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void FluTheme::frameColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void FluTheme::frameActiveColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void FluTheme::itemHoverColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void FluTheme::itemPressColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}

// SIGNAL 14
void FluTheme::itemCheckColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 14, nullptr);
}

// SIGNAL 15
void FluTheme::desktopImagePathChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 15, nullptr);
}

// SIGNAL 16
void FluTheme::darkModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 16, nullptr);
}

// SIGNAL 17
void FluTheme::nativeTextChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 17, nullptr);
}

// SIGNAL 18
void FluTheme::animationEnabledChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 18, nullptr);
}

// SIGNAL 19
void FluTheme::blurBehindWindowEnabledChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 19, nullptr);
}

// SIGNAL 20
void FluTheme::darkChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 20, nullptr);
}
QT_WARNING_POP
