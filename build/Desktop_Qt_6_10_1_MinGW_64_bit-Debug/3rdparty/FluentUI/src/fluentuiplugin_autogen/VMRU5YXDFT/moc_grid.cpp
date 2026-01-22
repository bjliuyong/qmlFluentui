/****************************************************************************
** Meta object code from reading C++ file 'grid.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/grid.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'grid.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot4GridE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::Grid::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot4GridE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::Grid",
        "QML.Element",
        "PlotGrid",
        "QML.Creatable",
        "false",
        "QML.UncreatableReason",
        "",
        "visibleChanged",
        "subVisibleChanged",
        "lineWidthChanged",
        "lineColorChanged",
        "QColor",
        "lineTypeChanged",
        "LineType",
        "subLineWidthChanged",
        "subLineColorChanged",
        "subLineTypeChanged",
        "visible",
        "subVisible",
        "lineWidth",
        "lineColor",
        "lineType",
        "subLineWidth",
        "subLineColor",
        "subLineType",
        "NoPen",
        "SolidLine",
        "DashLine",
        "DotLine",
        "DashDotLine",
        "DashDotDotLine"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'visibleChanged'
        QtMocHelpers::SignalData<void(bool)>(7, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 6 },
        }}),
        // Signal 'subVisibleChanged'
        QtMocHelpers::SignalData<void(bool)>(8, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 6 },
        }}),
        // Signal 'lineWidthChanged'
        QtMocHelpers::SignalData<void(int)>(9, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Signal 'lineColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(10, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 11, 6 },
        }}),
        // Signal 'lineTypeChanged'
        QtMocHelpers::SignalData<void(enum LineType)>(12, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 13, 6 },
        }}),
        // Signal 'subLineWidthChanged'
        QtMocHelpers::SignalData<void(int)>(14, 6, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Signal 'subLineColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(15, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 11, 6 },
        }}),
        // Signal 'subLineTypeChanged'
        QtMocHelpers::SignalData<void(enum LineType)>(16, 6, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 13, 6 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'visible'
        QtMocHelpers::PropertyData<bool>(17, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'subVisible'
        QtMocHelpers::PropertyData<bool>(18, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'lineWidth'
        QtMocHelpers::PropertyData<int>(19, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'lineColor'
        QtMocHelpers::PropertyData<QColor>(20, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'lineType'
        QtMocHelpers::PropertyData<enum LineType>(21, 0x80000000 | 13, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'subLineWidth'
        QtMocHelpers::PropertyData<int>(22, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 5),
        // property 'subLineColor'
        QtMocHelpers::PropertyData<QColor>(23, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 6),
        // property 'subLineType'
        QtMocHelpers::PropertyData<enum LineType>(24, 0x80000000 | 13, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 7),
    };
    QtMocHelpers::UintData qt_enums {
        // enum 'LineType'
        QtMocHelpers::EnumData<enum LineType>(13, 13, QMC::EnumFlags{}).add({
            {   25, LineType::NoPen },
            {   26, LineType::SolidLine },
            {   27, LineType::DashLine },
            {   28, LineType::DotLine },
            {   29, LineType::DashDotLine },
            {   30, LineType::DashDotDotLine },
        }),
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
            {    3,    4 },
            {    5,    6 },
    });
    return QtMocHelpers::metaObjectData<Grid, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::Grid::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4GridE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4GridE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot4GridE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::Grid::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Grid *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->visibleChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 1: _t->subVisibleChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 2: _t->lineWidthChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 3: _t->lineColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 4: _t->lineTypeChanged((*reinterpret_cast<std::add_pointer_t<enum LineType>>(_a[1]))); break;
        case 5: _t->subLineWidthChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 6: _t->subLineColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 7: _t->subLineTypeChanged((*reinterpret_cast<std::add_pointer_t<enum LineType>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(bool )>(_a, &Grid::visibleChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(bool )>(_a, &Grid::subVisibleChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(int )>(_a, &Grid::lineWidthChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(QColor )>(_a, &Grid::lineColorChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(LineType )>(_a, &Grid::lineTypeChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(int )>(_a, &Grid::subLineWidthChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(QColor )>(_a, &Grid::subLineColorChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (Grid::*)(LineType )>(_a, &Grid::subLineTypeChanged, 7))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->visible(); break;
        case 1: *reinterpret_cast<bool*>(_v) = _t->subVisible(); break;
        case 2: *reinterpret_cast<int*>(_v) = _t->lineWidth(); break;
        case 3: *reinterpret_cast<QColor*>(_v) = _t->lineColor(); break;
        case 4: *reinterpret_cast<enum LineType*>(_v) = _t->lineType(); break;
        case 5: *reinterpret_cast<int*>(_v) = _t->subLineWidth(); break;
        case 6: *reinterpret_cast<QColor*>(_v) = _t->subLineColor(); break;
        case 7: *reinterpret_cast<enum LineType*>(_v) = _t->subLineType(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_visible(*reinterpret_cast<bool*>(_v)); break;
        case 1: _t->set_subVisible(*reinterpret_cast<bool*>(_v)); break;
        case 2: _t->set_lineWidth(*reinterpret_cast<int*>(_v)); break;
        case 3: _t->set_lineColor(*reinterpret_cast<QColor*>(_v)); break;
        case 4: _t->set_lineType(*reinterpret_cast<enum LineType*>(_v)); break;
        case 5: _t->set_subLineWidth(*reinterpret_cast<int*>(_v)); break;
        case 6: _t->set_subLineColor(*reinterpret_cast<QColor*>(_v)); break;
        case 7: _t->set_subLineType(*reinterpret_cast<enum LineType*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::Grid::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::Grid::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot4GridE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlQCustomPlot::Grid::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void QmlQCustomPlot::Grid::visibleChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void QmlQCustomPlot::Grid::subVisibleChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1);
}

// SIGNAL 2
void QmlQCustomPlot::Grid::lineWidthChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1);
}

// SIGNAL 3
void QmlQCustomPlot::Grid::lineColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1);
}

// SIGNAL 4
void QmlQCustomPlot::Grid::lineTypeChanged(LineType _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1);
}

// SIGNAL 5
void QmlQCustomPlot::Grid::subLineWidthChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}

// SIGNAL 6
void QmlQCustomPlot::Grid::subLineColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 6, nullptr, _t1);
}

// SIGNAL 7
void QmlQCustomPlot::Grid::subLineTypeChanged(LineType _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 7, nullptr, _t1);
}
QT_WARNING_POP
