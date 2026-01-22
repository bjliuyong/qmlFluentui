/****************************************************************************
** Meta object code from reading C++ file 'FluAccentColor.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluAccentColor.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluAccentColor.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14FluAccentColorE_t {};
} // unnamed namespace

template <> constexpr inline auto FluAccentColor::qt_create_metaobjectdata<qt_meta_tag_ZN14FluAccentColorE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluAccentColor",
        "QML.Element",
        "darkestChanged",
        "",
        "darkerChanged",
        "darkChanged",
        "normalChanged",
        "lightChanged",
        "lighterChanged",
        "lightestChanged",
        "darkest",
        "QColor",
        "darker",
        "dark",
        "normal",
        "light",
        "lighter",
        "lightest"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'darkestChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'darkerChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'darkChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'normalChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lightChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lighterChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lightestChanged'
        QtMocHelpers::SignalData<void()>(9, 3, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'darkest'
        QtMocHelpers::PropertyData<QColor>(10, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'darker'
        QtMocHelpers::PropertyData<QColor>(12, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'dark'
        QtMocHelpers::PropertyData<QColor>(13, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'normal'
        QtMocHelpers::PropertyData<QColor>(14, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'light'
        QtMocHelpers::PropertyData<QColor>(15, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'lighter'
        QtMocHelpers::PropertyData<QColor>(16, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
        // property 'lightest'
        QtMocHelpers::PropertyData<QColor>(17, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 6),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluAccentColor, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluAccentColor::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FluAccentColorE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FluAccentColorE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14FluAccentColorE_t>.metaTypes,
    nullptr
} };

void FluAccentColor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluAccentColor *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->darkestChanged(); break;
        case 1: _t->darkerChanged(); break;
        case 2: _t->darkChanged(); break;
        case 3: _t->normalChanged(); break;
        case 4: _t->lightChanged(); break;
        case 5: _t->lighterChanged(); break;
        case 6: _t->lightestChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::darkestChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::darkerChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::darkChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::normalChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::lightChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::lighterChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluAccentColor::*)()>(_a, &FluAccentColor::lightestChanged, 6))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QColor*>(_v) = _t->_darkest; break;
        case 1: *reinterpret_cast<QColor*>(_v) = _t->_darker; break;
        case 2: *reinterpret_cast<QColor*>(_v) = _t->_dark; break;
        case 3: *reinterpret_cast<QColor*>(_v) = _t->_normal; break;
        case 4: *reinterpret_cast<QColor*>(_v) = _t->_light; break;
        case 5: *reinterpret_cast<QColor*>(_v) = _t->_lighter; break;
        case 6: *reinterpret_cast<QColor*>(_v) = _t->_lightest; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_darkest, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->darkestChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_darker, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->darkerChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_dark, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->darkChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_normal, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->normalChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_light, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->lightChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_lighter, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->lighterChanged();
            break;
        case 6:
            if (QtMocHelpers::setProperty(_t->_lightest, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->lightestChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluAccentColor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluAccentColor::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14FluAccentColorE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluAccentColor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 7;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void FluAccentColor::darkestChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluAccentColor::darkerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluAccentColor::darkChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluAccentColor::normalChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluAccentColor::lightChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluAccentColor::lighterChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluAccentColor::lightestChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
