/****************************************************************************
** Meta object code from reading C++ file 'FluCountTimer.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluCountTimer.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluCountTimer.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN13FluCountTimerE_t {};
} // unnamed namespace

template <> constexpr inline auto FluCountTimer::qt_create_metaobjectdata<qt_meta_tag_ZN13FluCountTimerE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluCountTimer",
        "QML.Element",
        "countTypeChanged",
        "",
        "valueChanged",
        "intervalChanged",
        "runningChanged",
        "formatChanged",
        "hourChanged",
        "minuteChanged",
        "secondChanged",
        "millisecondChanged",
        "timeChanged",
        "finished",
        "start",
        "stop",
        "reset",
        "baseValue",
        "onTimeout",
        "onRunningChanged",
        "countType",
        "CountType",
        "value",
        "interval",
        "running",
        "format",
        "hour",
        "minute",
        "second",
        "millisecond",
        "time",
        "Countdown",
        "Countup"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'countTypeChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'valueChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'intervalChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'runningChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'formatChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'hourChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'minuteChanged'
        QtMocHelpers::SignalData<void()>(9, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'secondChanged'
        QtMocHelpers::SignalData<void()>(10, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'millisecondChanged'
        QtMocHelpers::SignalData<void()>(11, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'timeChanged'
        QtMocHelpers::SignalData<void()>(12, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'finished'
        QtMocHelpers::SignalData<void()>(13, 3, QMC::AccessPublic, QMetaType::Void),
        // Slot 'start'
        QtMocHelpers::SlotData<void()>(14, 3, QMC::AccessPublic, QMetaType::Void),
        // Slot 'stop'
        QtMocHelpers::SlotData<void()>(15, 3, QMC::AccessPublic, QMetaType::Void),
        // Slot 'reset'
        QtMocHelpers::SlotData<void(int)>(16, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 17 },
        }}),
        // Slot 'reset'
        QtMocHelpers::SlotData<void()>(16, 3, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Slot 'onTimeout'
        QtMocHelpers::SlotData<void()>(18, 3, QMC::AccessPrivate, QMetaType::Void),
        // Slot 'onRunningChanged'
        QtMocHelpers::SlotData<void()>(19, 3, QMC::AccessPrivate, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'countType'
        QtMocHelpers::PropertyData<enum CountType>(20, 0x80000000 | 21, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'value'
        QtMocHelpers::PropertyData<int>(22, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'interval'
        QtMocHelpers::PropertyData<int>(23, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'running'
        QtMocHelpers::PropertyData<bool>(24, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 3),
        // property 'format'
        QtMocHelpers::PropertyData<QString>(25, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 4),
        // property 'hour'
        QtMocHelpers::PropertyData<int>(26, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Final, 5),
        // property 'minute'
        QtMocHelpers::PropertyData<int>(27, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Final, 6),
        // property 'second'
        QtMocHelpers::PropertyData<int>(28, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Final, 7),
        // property 'millisecond'
        QtMocHelpers::PropertyData<int>(29, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Final, 8),
        // property 'time'
        QtMocHelpers::PropertyData<QString>(30, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Final, 9),
    };
    QtMocHelpers::UintData qt_enums {
        // enum 'CountType'
        QtMocHelpers::EnumData<enum CountType>(21, 21, QMC::EnumFlags{}).add({
            {   31, CountType::Countdown },
            {   32, CountType::Countup },
        }),
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluCountTimer, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluCountTimer::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluCountTimerE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluCountTimerE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN13FluCountTimerE_t>.metaTypes,
    nullptr
} };

void FluCountTimer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluCountTimer *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->countTypeChanged(); break;
        case 1: _t->valueChanged(); break;
        case 2: _t->intervalChanged(); break;
        case 3: _t->runningChanged(); break;
        case 4: _t->formatChanged(); break;
        case 5: _t->hourChanged(); break;
        case 6: _t->minuteChanged(); break;
        case 7: _t->secondChanged(); break;
        case 8: _t->millisecondChanged(); break;
        case 9: _t->timeChanged(); break;
        case 10: _t->finished(); break;
        case 11: _t->start(); break;
        case 12: _t->stop(); break;
        case 13: _t->reset((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 14: _t->reset(); break;
        case 15: _t->onTimeout(); break;
        case 16: _t->onRunningChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::countTypeChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::valueChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::intervalChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::runningChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::formatChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::hourChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::minuteChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::secondChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::millisecondChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::timeChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCountTimer::*)()>(_a, &FluCountTimer::finished, 10))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<enum CountType*>(_v) = _t->_countType; break;
        case 1: *reinterpret_cast<int*>(_v) = _t->_value; break;
        case 2: *reinterpret_cast<int*>(_v) = _t->_interval; break;
        case 3: *reinterpret_cast<bool*>(_v) = _t->_running; break;
        case 4: *reinterpret_cast<QString*>(_v) = _t->_format; break;
        case 5: *reinterpret_cast<int*>(_v) = _t->hour(); break;
        case 6: *reinterpret_cast<int*>(_v) = _t->minute(); break;
        case 7: *reinterpret_cast<int*>(_v) = _t->second(); break;
        case 8: *reinterpret_cast<int*>(_v) = _t->millisecond(); break;
        case 9: *reinterpret_cast<QString*>(_v) = _t->time(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_countType, *reinterpret_cast<enum CountType*>(_v)))
                Q_EMIT _t->countTypeChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_value, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->valueChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_interval, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->intervalChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_running, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->runningChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_format, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->formatChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluCountTimer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluCountTimer::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluCountTimerE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluCountTimer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 17)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 17;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void FluCountTimer::countTypeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluCountTimer::valueChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluCountTimer::intervalChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluCountTimer::runningChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluCountTimer::formatChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluCountTimer::hourChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluCountTimer::minuteChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void FluCountTimer::secondChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void FluCountTimer::millisecondChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void FluCountTimer::timeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void FluCountTimer::finished()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}
QT_WARNING_POP
