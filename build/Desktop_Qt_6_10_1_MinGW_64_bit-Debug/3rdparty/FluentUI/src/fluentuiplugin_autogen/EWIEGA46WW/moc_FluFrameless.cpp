/****************************************************************************
** Meta object code from reading C++ file 'FluFrameless.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluFrameless.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluFrameless.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN12FluFramelessE_t {};
} // unnamed namespace

template <> constexpr inline auto FluFrameless::qt_create_metaobjectdata<qt_meta_tag_ZN12FluFramelessE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluFrameless",
        "QML.Element",
        "appbarChanged",
        "",
        "maximizeButtonChanged",
        "minimizedButtonChanged",
        "closeButtonChanged",
        "topmostChanged",
        "disabledChanged",
        "fixSizeChanged",
        "effectChanged",
        "effectiveChanged",
        "availableEffectsChanged",
        "isDarkModeChanged",
        "useSystemEffectChanged",
        "showFullScreen",
        "showMaximized",
        "showMinimized",
        "showNormal",
        "setHitTestVisible",
        "QQuickItem*",
        "onDestruction",
        "appbar",
        "maximizeButton",
        "minimizedButton",
        "closeButton",
        "topmost",
        "disabled",
        "fixSize",
        "effect",
        "effective",
        "availableEffects",
        "isDarkMode",
        "useSystemEffect"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'appbarChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'maximizeButtonChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'minimizedButtonChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'closeButtonChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'topmostChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'disabledChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'fixSizeChanged'
        QtMocHelpers::SignalData<void()>(9, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'effectChanged'
        QtMocHelpers::SignalData<void()>(10, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'effectiveChanged'
        QtMocHelpers::SignalData<void()>(11, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'availableEffectsChanged'
        QtMocHelpers::SignalData<void()>(12, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'isDarkModeChanged'
        QtMocHelpers::SignalData<void()>(13, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'useSystemEffectChanged'
        QtMocHelpers::SignalData<void()>(14, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'showFullScreen'
        QtMocHelpers::MethodData<void()>(15, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'showMaximized'
        QtMocHelpers::MethodData<void()>(16, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'showMinimized'
        QtMocHelpers::MethodData<void()>(17, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'showNormal'
        QtMocHelpers::MethodData<void()>(18, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'setHitTestVisible'
        QtMocHelpers::MethodData<void(QQuickItem *)>(19, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 20, 3 },
        }}),
        // Method 'onDestruction'
        QtMocHelpers::MethodData<void()>(21, 3, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'appbar'
        QtMocHelpers::PropertyData<QQuickItem*>(22, 0x80000000 | 20, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'maximizeButton'
        QtMocHelpers::PropertyData<QQuickItem*>(23, 0x80000000 | 20, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'minimizedButton'
        QtMocHelpers::PropertyData<QQuickItem*>(24, 0x80000000 | 20, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'closeButton'
        QtMocHelpers::PropertyData<QQuickItem*>(25, 0x80000000 | 20, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'topmost'
        QtMocHelpers::PropertyData<bool>(26, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 4),
        // property 'disabled'
        QtMocHelpers::PropertyData<bool>(27, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 5),
        // property 'fixSize'
        QtMocHelpers::PropertyData<bool>(28, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 6),
        // property 'effect'
        QtMocHelpers::PropertyData<QString>(29, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 7),
        // property 'effective'
        QtMocHelpers::PropertyData<bool>(30, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Final, 8),
        // property 'availableEffects'
        QtMocHelpers::PropertyData<QStringList>(31, QMetaType::QStringList, QMC::DefaultPropertyFlags | QMC::Final, 9),
        // property 'isDarkMode'
        QtMocHelpers::PropertyData<bool>(32, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 10),
        // property 'useSystemEffect'
        QtMocHelpers::PropertyData<bool>(33, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 11),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluFrameless, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluFrameless::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluFramelessE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluFramelessE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12FluFramelessE_t>.metaTypes,
    nullptr
} };

void FluFrameless::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluFrameless *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->appbarChanged(); break;
        case 1: _t->maximizeButtonChanged(); break;
        case 2: _t->minimizedButtonChanged(); break;
        case 3: _t->closeButtonChanged(); break;
        case 4: _t->topmostChanged(); break;
        case 5: _t->disabledChanged(); break;
        case 6: _t->fixSizeChanged(); break;
        case 7: _t->effectChanged(); break;
        case 8: _t->effectiveChanged(); break;
        case 9: _t->availableEffectsChanged(); break;
        case 10: _t->isDarkModeChanged(); break;
        case 11: _t->useSystemEffectChanged(); break;
        case 12: _t->showFullScreen(); break;
        case 13: _t->showMaximized(); break;
        case 14: _t->showMinimized(); break;
        case 15: _t->showNormal(); break;
        case 16: _t->setHitTestVisible((*reinterpret_cast<std::add_pointer_t<QQuickItem*>>(_a[1]))); break;
        case 17: _t->onDestruction(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 16:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QQuickItem* >(); break;
            }
            break;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::appbarChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::maximizeButtonChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::minimizedButtonChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::closeButtonChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::topmostChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::disabledChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::fixSizeChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::effectChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::effectiveChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::availableEffectsChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::isDarkModeChanged, 10))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluFrameless::*)()>(_a, &FluFrameless::useSystemEffectChanged, 11))
            return;
    }
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 3:
        case 2:
        case 1:
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QQuickItem* >(); break;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QQuickItem**>(_v) = _t->_appbar; break;
        case 1: *reinterpret_cast<QQuickItem**>(_v) = _t->_maximizeButton; break;
        case 2: *reinterpret_cast<QQuickItem**>(_v) = _t->_minimizedButton; break;
        case 3: *reinterpret_cast<QQuickItem**>(_v) = _t->_closeButton; break;
        case 4: *reinterpret_cast<bool*>(_v) = _t->_topmost; break;
        case 5: *reinterpret_cast<bool*>(_v) = _t->_disabled; break;
        case 6: *reinterpret_cast<bool*>(_v) = _t->_fixSize; break;
        case 7: *reinterpret_cast<QString*>(_v) = _t->_effect; break;
        case 8: *reinterpret_cast<bool*>(_v) = _t->effective(); break;
        case 9: *reinterpret_cast<QStringList*>(_v) = _t->availableEffects(); break;
        case 10: *reinterpret_cast<bool*>(_v) = _t->_isDarkMode; break;
        case 11: *reinterpret_cast<bool*>(_v) = _t->_useSystemEffect; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_appbar, *reinterpret_cast<QQuickItem**>(_v)))
                Q_EMIT _t->appbarChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_maximizeButton, *reinterpret_cast<QQuickItem**>(_v)))
                Q_EMIT _t->maximizeButtonChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_minimizedButton, *reinterpret_cast<QQuickItem**>(_v)))
                Q_EMIT _t->minimizedButtonChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_closeButton, *reinterpret_cast<QQuickItem**>(_v)))
                Q_EMIT _t->closeButtonChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_topmost, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->topmostChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_disabled, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->disabledChanged();
            break;
        case 6:
            if (QtMocHelpers::setProperty(_t->_fixSize, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->fixSizeChanged();
            break;
        case 7:
            if (QtMocHelpers::setProperty(_t->_effect, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->effectChanged();
            break;
        case 10:
            if (QtMocHelpers::setProperty(_t->_isDarkMode, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->isDarkModeChanged();
            break;
        case 11:
            if (QtMocHelpers::setProperty(_t->_useSystemEffect, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->useSystemEffectChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluFrameless::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluFrameless::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluFramelessE_t>.strings))
        return static_cast<void*>(this);
    if (!strcmp(_clname, "QAbstractNativeEventFilter"))
        return static_cast< QAbstractNativeEventFilter*>(this);
    return QQuickItem::qt_metacast(_clname);
}

int FluFrameless::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 18)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 18;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 18)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 18;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    return _id;
}

// SIGNAL 0
void FluFrameless::appbarChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluFrameless::maximizeButtonChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluFrameless::minimizedButtonChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluFrameless::closeButtonChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluFrameless::topmostChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluFrameless::disabledChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluFrameless::fixSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void FluFrameless::effectChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void FluFrameless::effectiveChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void FluFrameless::availableEffectsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void FluFrameless::isDarkModeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void FluFrameless::useSystemEffectChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}
QT_WARNING_POP
