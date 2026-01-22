/****************************************************************************
** Meta object code from reading C++ file 'axis.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/axis.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'axis.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::Axis::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::Axis",
        "QML.Element",
        "auto",
        "QML.Creatable",
        "false",
        "QML.UncreatableReason",
        "",
        "visibleChanged",
        "labelChanged",
        "upperChanged",
        "lowerChanged",
        "gridChanged",
        "QmlQCustomPlot::Grid*",
        "tickerChanged",
        "QmlQCustomPlot::Ticker*",
        "setTickerType",
        "TickerType",
        "type",
        "setRange",
        "position",
        "size",
        "Qt::AlignmentFlag",
        "align",
        "lower",
        "upper",
        "visible",
        "label",
        "grid",
        "ticker",
        "Fixed",
        "Log",
        "Pi",
        "Text",
        "DateTime",
        "Time"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'visibleChanged'
        QtMocHelpers::SignalData<void(bool)>(7, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 6 },
        }}),
        // Signal 'labelChanged'
        QtMocHelpers::SignalData<void(QString)>(8, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 6 },
        }}),
        // Signal 'upperChanged'
        QtMocHelpers::SignalData<void(float)>(9, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Float, 6 },
        }}),
        // Signal 'lowerChanged'
        QtMocHelpers::SignalData<void(float)>(10, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Float, 6 },
        }}),
        // Signal 'gridChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Grid *)>(11, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 12, 6 },
        }}),
        // Signal 'tickerChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Ticker *)>(13, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 14, 6 },
        }}),
        // Method 'setTickerType'
        QtMocHelpers::MethodData<void(enum TickerType)>(15, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 16, 17 },
        }}),
        // Method 'setRange'
        QtMocHelpers::MethodData<void(float, float, Qt::AlignmentFlag)>(18, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Float, 19 }, { QMetaType::Float, 20 }, { 0x80000000 | 21, 22 },
        }}),
        // Method 'setRange'
        QtMocHelpers::MethodData<void(float, float)>(18, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Float, 23 }, { QMetaType::Float, 24 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'visible'
        QtMocHelpers::PropertyData<bool>(25, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'label'
        QtMocHelpers::PropertyData<QString>(26, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'upper'
        QtMocHelpers::PropertyData<float>(24, QMetaType::Float, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'lower'
        QtMocHelpers::PropertyData<float>(23, QMetaType::Float, QMC::DefaultPropertyFlags | QMC::Writable, 3),
        // property 'grid'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Grid*>(27, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::EnumOrFlag | QMC::Constant),
        // property 'ticker'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Ticker*>(28, 0x80000000 | 14, QMC::DefaultPropertyFlags | QMC::EnumOrFlag | QMC::Constant),
    };
    QtMocHelpers::UintData qt_enums {
        // enum 'TickerType'
        QtMocHelpers::EnumData<enum TickerType>(16, 16, QMC::EnumFlags{}).add({
            {   29, TickerType::Fixed },
            {   30, TickerType::Log },
            {   31, TickerType::Pi },
            {   32, TickerType::Text },
            {   33, TickerType::DateTime },
            {   34, TickerType::Time },
        }),
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
            {    3,    4 },
            {    5,    6 },
    });
    return QtMocHelpers::metaObjectData<Axis, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::Axis::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::Axis::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Axis *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->visibleChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 1: _t->labelChanged((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 2: _t->upperChanged((*reinterpret_cast<std::add_pointer_t<float>>(_a[1]))); break;
        case 3: _t->lowerChanged((*reinterpret_cast<std::add_pointer_t<float>>(_a[1]))); break;
        case 4: _t->gridChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Grid*>>(_a[1]))); break;
        case 5: _t->tickerChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Ticker*>>(_a[1]))); break;
        case 6: _t->setTickerType((*reinterpret_cast<std::add_pointer_t<enum TickerType>>(_a[1]))); break;
        case 7: _t->setRange((*reinterpret_cast<std::add_pointer_t<float>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<float>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<Qt::AlignmentFlag>>(_a[3]))); break;
        case 8: _t->setRange((*reinterpret_cast<std::add_pointer_t<float>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<float>>(_a[2]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Grid* >(); break;
            }
            break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Ticker* >(); break;
            }
            break;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(bool )>(_a, &Axis::visibleChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(QString )>(_a, &Axis::labelChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(float )>(_a, &Axis::upperChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(float )>(_a, &Axis::lowerChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(QmlQCustomPlot::Grid * )>(_a, &Axis::gridChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (Axis::*)(QmlQCustomPlot::Ticker * )>(_a, &Axis::tickerChanged, 5))
            return;
    }
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QmlQCustomPlot::Grid* >(); break;
        case 5:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QmlQCustomPlot::Ticker* >(); break;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->visible(); break;
        case 1: *reinterpret_cast<QString*>(_v) = _t->label(); break;
        case 2: *reinterpret_cast<float*>(_v) = _t->upper(); break;
        case 3: *reinterpret_cast<float*>(_v) = _t->lower(); break;
        case 4: *reinterpret_cast<QmlQCustomPlot::Grid**>(_v) = _t->grid(); break;
        case 5: *reinterpret_cast<QmlQCustomPlot::Ticker**>(_v) = _t->ticker(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_visible(*reinterpret_cast<bool*>(_v)); break;
        case 1: _t->set_label(*reinterpret_cast<QString*>(_v)); break;
        case 2: _t->set_upper(*reinterpret_cast<float*>(_v)); break;
        case 3: _t->set_lower(*reinterpret_cast<float*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::Axis::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::Axis::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4AxisE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlQCustomPlot::Axis::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void QmlQCustomPlot::Axis::visibleChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void QmlQCustomPlot::Axis::labelChanged(QString _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1);
}

// SIGNAL 2
void QmlQCustomPlot::Axis::upperChanged(float _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1);
}

// SIGNAL 3
void QmlQCustomPlot::Axis::lowerChanged(float _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1);
}

// SIGNAL 4
void QmlQCustomPlot::Axis::gridChanged(QmlQCustomPlot::Grid * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1);
}

// SIGNAL 5
void QmlQCustomPlot::Axis::tickerChanged(QmlQCustomPlot::Ticker * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}
QT_WARNING_POP
