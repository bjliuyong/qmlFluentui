/****************************************************************************
** Meta object code from reading C++ file 'TimePlot.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/TimePlot.h"
#include <QtGui/qtextcursor.h>
#include <QtGui/qscreen.h>
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'TimePlot.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::TimePlot::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::TimePlot",
        "QML.Element",
        "auto",
        "plotTimeRangeInMillisecondsChanged",
        "",
        "updatePlot",
        "setTimeFormat",
        "format",
        "addCurrentTimeValue",
        "name",
        "value",
        "addCurrentTimeValues",
        "QVariantMap",
        "values",
        "plotTimeRangeInMilliseconds"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'plotTimeRangeInMillisecondsChanged'
        QtMocHelpers::SignalData<void(int)>(3, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 4 },
        }}),
        // Slot 'updatePlot'
        QtMocHelpers::SlotData<void()>(5, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'setTimeFormat'
        QtMocHelpers::MethodData<void(const QString &)>(6, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 7 },
        }}),
        // Method 'addCurrentTimeValue'
        QtMocHelpers::MethodData<void(const QString &, double)>(8, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 9 }, { QMetaType::Double, 10 },
        }}),
        // Method 'addCurrentTimeValues'
        QtMocHelpers::MethodData<void(QVariantMap)>(11, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 12, 13 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'plotTimeRangeInMilliseconds'
        QtMocHelpers::PropertyData<int>(14, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 0),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
    });
    return QtMocHelpers::metaObjectData<TimePlot, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::TimePlot::staticMetaObject = { {
    QMetaObject::SuperData::link<BasePlot::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::TimePlot::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<TimePlot *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->plotTimeRangeInMillisecondsChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 1: _t->updatePlot(); break;
        case 2: _t->setTimeFormat((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 3: _t->addCurrentTimeValue((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2]))); break;
        case 4: _t->addCurrentTimeValues((*reinterpret_cast<std::add_pointer_t<QVariantMap>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (TimePlot::*)(int )>(_a, &TimePlot::plotTimeRangeInMillisecondsChanged, 0))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<int*>(_v) = _t->plotTimeRangeInMilliseconds(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_plotTimeRangeInMilliseconds(*reinterpret_cast<int*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::TimePlot::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::TimePlot::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8TimePlotE_t>.strings))
        return static_cast<void*>(this);
    return BasePlot::qt_metacast(_clname);
}

int QmlQCustomPlot::TimePlot::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = BasePlot::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 5;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void QmlQCustomPlot::TimePlot::plotTimeRangeInMillisecondsChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}
QT_WARNING_POP
