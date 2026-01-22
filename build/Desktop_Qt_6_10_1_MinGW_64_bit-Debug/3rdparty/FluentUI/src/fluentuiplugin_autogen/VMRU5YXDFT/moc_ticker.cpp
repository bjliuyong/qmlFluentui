/****************************************************************************
** Meta object code from reading C++ file 'ticker.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/ticker.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ticker.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::Ticker::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::Ticker",
        "QML.Element",
        "auto",
        "QML.Creatable",
        "false",
        "QML.UncreatableReason",
        "",
        "ticksChanged",
        "subTicksChanged",
        "tickCountChanged",
        "baseWidthChanged",
        "baseColorChanged",
        "QColor",
        "tickColorChanged",
        "subTickColorChanged",
        "ticks",
        "subTicks",
        "tickCount",
        "baseWidth",
        "baseColor",
        "tickColor",
        "subTickColor"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'ticksChanged'
        QtMocHelpers::SignalData<void(bool)>(7, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 6 },
        }}),
        // Signal 'subTicksChanged'
        QtMocHelpers::SignalData<void(bool)>(8, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 6 },
        }}),
        // Signal 'tickCountChanged'
        QtMocHelpers::SignalData<void(int)>(9, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Signal 'baseWidthChanged'
        QtMocHelpers::SignalData<void(int)>(10, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Signal 'baseColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(11, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 12, 6 },
        }}),
        // Signal 'tickColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(13, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 12, 6 },
        }}),
        // Signal 'subTickColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(14, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 12, 6 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'ticks'
        QtMocHelpers::PropertyData<bool>(15, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'subTicks'
        QtMocHelpers::PropertyData<bool>(16, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'tickCount'
        QtMocHelpers::PropertyData<int>(17, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'baseWidth'
        QtMocHelpers::PropertyData<int>(18, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 3),
        // property 'baseColor'
        QtMocHelpers::PropertyData<QColor>(19, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'tickColor'
        QtMocHelpers::PropertyData<QColor>(20, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
        // property 'subTickColor'
        QtMocHelpers::PropertyData<QColor>(21, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 6),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
            {    3,    4 },
            {    5,    6 },
    });
    return QtMocHelpers::metaObjectData<Ticker, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::Ticker::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::Ticker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Ticker *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->ticksChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 1: _t->subTicksChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 2: _t->tickCountChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 3: _t->baseWidthChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 4: _t->baseColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 5: _t->tickColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 6: _t->subTickColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(bool )>(_a, &Ticker::ticksChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(bool )>(_a, &Ticker::subTicksChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(int )>(_a, &Ticker::tickCountChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(int )>(_a, &Ticker::baseWidthChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(QColor )>(_a, &Ticker::baseColorChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(QColor )>(_a, &Ticker::tickColorChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (Ticker::*)(QColor )>(_a, &Ticker::subTickColorChanged, 6))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->ticks(); break;
        case 1: *reinterpret_cast<bool*>(_v) = _t->subTicks(); break;
        case 2: *reinterpret_cast<int*>(_v) = _t->tickCount(); break;
        case 3: *reinterpret_cast<int*>(_v) = _t->baseWidth(); break;
        case 4: *reinterpret_cast<QColor*>(_v) = _t->baseColor(); break;
        case 5: *reinterpret_cast<QColor*>(_v) = _t->tickColor(); break;
        case 6: *reinterpret_cast<QColor*>(_v) = _t->subTickColor(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_ticks(*reinterpret_cast<bool*>(_v)); break;
        case 1: _t->set_subTicks(*reinterpret_cast<bool*>(_v)); break;
        case 2: _t->set_tickCount(*reinterpret_cast<int*>(_v)); break;
        case 3: _t->set_baseWidth(*reinterpret_cast<int*>(_v)); break;
        case 4: _t->set_baseColor(*reinterpret_cast<QColor*>(_v)); break;
        case 5: _t->set_tickColor(*reinterpret_cast<QColor*>(_v)); break;
        case 6: _t->set_subTickColor(*reinterpret_cast<QColor*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::Ticker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::Ticker::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot6TickerE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlQCustomPlot::Ticker::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void QmlQCustomPlot::Ticker::ticksChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void QmlQCustomPlot::Ticker::subTicksChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1);
}

// SIGNAL 2
void QmlQCustomPlot::Ticker::tickCountChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1);
}

// SIGNAL 3
void QmlQCustomPlot::Ticker::baseWidthChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1);
}

// SIGNAL 4
void QmlQCustomPlot::Ticker::baseColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1);
}

// SIGNAL 5
void QmlQCustomPlot::Ticker::tickColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}

// SIGNAL 6
void QmlQCustomPlot::Ticker::subTickColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 6, nullptr, _t1);
}
QT_WARNING_POP
