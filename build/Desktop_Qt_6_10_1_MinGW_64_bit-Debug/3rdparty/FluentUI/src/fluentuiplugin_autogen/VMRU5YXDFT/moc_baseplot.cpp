/****************************************************************************
** Meta object code from reading C++ file 'baseplot.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/baseplot.h"
#include <QtGui/qtextcursor.h>
#include <QtGui/qscreen.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'baseplot.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::BasePlot::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::BasePlot",
        "QML.Element",
        "auto",
        "backgroundColorChanged",
        "",
        "QColor",
        "labelColorChanged",
        "baseColorChanged",
        "xAxisChanged",
        "QmlQCustomPlot::Axis*",
        "x1AxisChanged",
        "yAxisChanged",
        "y1AxisChanged",
        "graphsChanged",
        "rangeChanged",
        "maxBufferChanged",
        "refreshMsChanged",
        "pausedChanged",
        "initialXRangeChanged",
        "initialYRangeChanged",
        "appendBatch",
        "name",
        "QList<double>",
        "x",
        "y",
        "alreadySorted",
        "updatePlot",
        "setMaxBufferPoints",
        "n",
        "setRefreshMs",
        "ms",
        "setPaused",
        "p",
        "onRepaintTimer",
        "addGraph",
        "key",
        "removeGraph",
        "rescaleAxes",
        "onlyVisiblePlottables",
        "requestRepaint",
        "moveY",
        "percent",
        "zoomX",
        "px",
        "factor",
        "isScale",
        "zoomY",
        "py",
        "zoomXY",
        "resetRange",
        "setRangeByPixels",
        "x1",
        "y1",
        "x2",
        "y2",
        "backgroundColor",
        "labelColor",
        "baseColor",
        "xAxis",
        "x1Axis",
        "yAxis",
        "y1Axis",
        "maxBufferPoints",
        "refreshMs",
        "paused",
        "initialXRange",
        "QVariant",
        "initialYRange",
        "graphs",
        "QVariantMap"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'backgroundColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(3, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 5, 4 },
        }}),
        // Signal 'labelColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(6, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 5, 4 },
        }}),
        // Signal 'baseColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(7, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 5, 4 },
        }}),
        // Signal 'xAxisChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Axis *)>(8, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 4 },
        }}),
        // Signal 'x1AxisChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Axis *)>(10, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 4 },
        }}),
        // Signal 'yAxisChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Axis *)>(11, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 4 },
        }}),
        // Signal 'y1AxisChanged'
        QtMocHelpers::SignalData<void(QmlQCustomPlot::Axis *)>(12, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 4 },
        }}),
        // Signal 'graphsChanged'
        QtMocHelpers::SignalData<void()>(13, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'rangeChanged'
        QtMocHelpers::SignalData<void()>(14, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'maxBufferChanged'
        QtMocHelpers::SignalData<void()>(15, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'refreshMsChanged'
        QtMocHelpers::SignalData<void()>(16, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'pausedChanged'
        QtMocHelpers::SignalData<void()>(17, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'initialXRangeChanged'
        QtMocHelpers::SignalData<void()>(18, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'initialYRangeChanged'
        QtMocHelpers::SignalData<void()>(19, 4, QMC::AccessPublic, QMetaType::Void),
        // Slot 'appendBatch'
        QtMocHelpers::SlotData<void(const QString &, const QVector<double> &, const QVector<double> &, bool)>(20, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 21 }, { 0x80000000 | 22, 23 }, { 0x80000000 | 22, 24 }, { QMetaType::Bool, 25 },
        }}),
        // Slot 'appendBatch'
        QtMocHelpers::SlotData<void(const QVector<double> &, const QVector<double> &)>(20, 4, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 22, 23 }, { 0x80000000 | 22, 24 },
        }}),
        // Slot 'updatePlot'
        QtMocHelpers::SlotData<void()>(26, 4, QMC::AccessPublic, QMetaType::Void),
        // Slot 'setMaxBufferPoints'
        QtMocHelpers::SlotData<void(int)>(27, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 28 },
        }}),
        // Slot 'setRefreshMs'
        QtMocHelpers::SlotData<void(int)>(29, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 30 },
        }}),
        // Slot 'setPaused'
        QtMocHelpers::SlotData<void(bool)>(31, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 32 },
        }}),
        // Slot 'onRepaintTimer'
        QtMocHelpers::SlotData<void()>(33, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'addGraph'
        QtMocHelpers::MethodData<void(const QString &)>(34, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 35 },
        }}),
        // Method 'removeGraph'
        QtMocHelpers::MethodData<void(const QString &)>(36, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 35 },
        }}),
        // Method 'rescaleAxes'
        QtMocHelpers::MethodData<void(bool) const>(37, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 38 },
        }}),
        // Method 'rescaleAxes'
        QtMocHelpers::MethodData<void() const>(37, 4, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void),
        // Method 'requestRepaint'
        QtMocHelpers::MethodData<void() const>(39, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'moveY'
        QtMocHelpers::MethodData<void(double) const>(40, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 41 },
        }}),
        // Method 'zoomX'
        QtMocHelpers::MethodData<void(double, double, bool) const>(42, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 43 }, { QMetaType::Double, 44 }, { QMetaType::Bool, 45 },
        }}),
        // Method 'zoomY'
        QtMocHelpers::MethodData<void(double, double, bool) const>(46, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 47 }, { QMetaType::Double, 44 }, { QMetaType::Bool, 45 },
        }}),
        // Method 'zoomXY'
        QtMocHelpers::MethodData<void(double, double, double, bool) const>(48, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 43 }, { QMetaType::Double, 47 }, { QMetaType::Double, 44 }, { QMetaType::Bool, 45 },
        }}),
        // Method 'resetRange'
        QtMocHelpers::MethodData<void() const>(49, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'setRangeByPixels'
        QtMocHelpers::MethodData<void(double, double, double, double)>(50, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 51 }, { QMetaType::Double, 52 }, { QMetaType::Double, 53 }, { QMetaType::Double, 54 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'backgroundColor'
        QtMocHelpers::PropertyData<QColor>(55, 0x80000000 | 5, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'labelColor'
        QtMocHelpers::PropertyData<QColor>(56, 0x80000000 | 5, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'baseColor'
        QtMocHelpers::PropertyData<QColor>(57, 0x80000000 | 5, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'xAxis'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Axis*>(58, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 3),
        // property 'x1Axis'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Axis*>(59, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 4),
        // property 'yAxis'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Axis*>(60, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 5),
        // property 'y1Axis'
        QtMocHelpers::PropertyData<QmlQCustomPlot::Axis*>(61, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 6),
        // property 'maxBufferPoints'
        QtMocHelpers::PropertyData<int>(62, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 9),
        // property 'refreshMs'
        QtMocHelpers::PropertyData<int>(63, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 10),
        // property 'paused'
        QtMocHelpers::PropertyData<bool>(64, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable | QMC::StdCppSet, 11),
        // property 'initialXRange'
        QtMocHelpers::PropertyData<QVariant>(65, 0x80000000 | 66, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag | QMC::StdCppSet, 12),
        // property 'initialYRange'
        QtMocHelpers::PropertyData<QVariant>(67, 0x80000000 | 66, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag | QMC::StdCppSet, 13),
        // property 'graphs'
        QtMocHelpers::PropertyData<QVariantMap>(68, 0x80000000 | 69, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 7),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
    });
    return QtMocHelpers::metaObjectData<BasePlot, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::BasePlot::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::BasePlot::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<BasePlot *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->backgroundColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 1: _t->labelColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 2: _t->baseColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 3: _t->xAxisChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Axis*>>(_a[1]))); break;
        case 4: _t->x1AxisChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Axis*>>(_a[1]))); break;
        case 5: _t->yAxisChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Axis*>>(_a[1]))); break;
        case 6: _t->y1AxisChanged((*reinterpret_cast<std::add_pointer_t<QmlQCustomPlot::Axis*>>(_a[1]))); break;
        case 7: _t->graphsChanged(); break;
        case 8: _t->rangeChanged(); break;
        case 9: _t->maxBufferChanged(); break;
        case 10: _t->refreshMsChanged(); break;
        case 11: _t->pausedChanged(); break;
        case 12: _t->initialXRangeChanged(); break;
        case 13: _t->initialYRangeChanged(); break;
        case 14: _t->appendBatch((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[3])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[4]))); break;
        case 15: _t->appendBatch((*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[2]))); break;
        case 16: _t->updatePlot(); break;
        case 17: _t->setMaxBufferPoints((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 18: _t->setRefreshMs((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 19: _t->setPaused((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 20: _t->onRepaintTimer(); break;
        case 21: _t->addGraph((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 22: _t->removeGraph((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 23: _t->rescaleAxes((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 24: _t->rescaleAxes(); break;
        case 25: _t->requestRepaint(); break;
        case 26: _t->moveY((*reinterpret_cast<std::add_pointer_t<double>>(_a[1]))); break;
        case 27: _t->zoomX((*reinterpret_cast<std::add_pointer_t<double>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[3]))); break;
        case 28: _t->zoomY((*reinterpret_cast<std::add_pointer_t<double>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[3]))); break;
        case 29: _t->zoomXY((*reinterpret_cast<std::add_pointer_t<double>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[3])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[4]))); break;
        case 30: _t->resetRange(); break;
        case 31: _t->setRangeByPixels((*reinterpret_cast<std::add_pointer_t<double>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[3])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[4]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Axis* >(); break;
            }
            break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Axis* >(); break;
            }
            break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Axis* >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QmlQCustomPlot::Axis* >(); break;
            }
            break;
        case 14:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 2:
            case 1:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<double> >(); break;
            }
            break;
        case 15:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 1:
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<double> >(); break;
            }
            break;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QColor )>(_a, &BasePlot::backgroundColorChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QColor )>(_a, &BasePlot::labelColorChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QColor )>(_a, &BasePlot::baseColorChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QmlQCustomPlot::Axis * )>(_a, &BasePlot::xAxisChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QmlQCustomPlot::Axis * )>(_a, &BasePlot::x1AxisChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QmlQCustomPlot::Axis * )>(_a, &BasePlot::yAxisChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)(QmlQCustomPlot::Axis * )>(_a, &BasePlot::y1AxisChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::graphsChanged, 7))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::rangeChanged, 8))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::maxBufferChanged, 9))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::refreshMsChanged, 10))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::pausedChanged, 11))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::initialXRangeChanged, 12))
            return;
        if (QtMocHelpers::indexOfMethod<void (BasePlot::*)()>(_a, &BasePlot::initialYRangeChanged, 13))
            return;
    }
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 6:
        case 5:
        case 4:
        case 3:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QmlQCustomPlot::Axis* >(); break;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QColor*>(_v) = _t->backgroundColor(); break;
        case 1: *reinterpret_cast<QColor*>(_v) = _t->labelColor(); break;
        case 2: *reinterpret_cast<QColor*>(_v) = _t->baseColor(); break;
        case 3: *reinterpret_cast<QmlQCustomPlot::Axis**>(_v) = _t->xAxis(); break;
        case 4: *reinterpret_cast<QmlQCustomPlot::Axis**>(_v) = _t->x1Axis(); break;
        case 5: *reinterpret_cast<QmlQCustomPlot::Axis**>(_v) = _t->yAxis(); break;
        case 6: *reinterpret_cast<QmlQCustomPlot::Axis**>(_v) = _t->y1Axis(); break;
        case 7: *reinterpret_cast<int*>(_v) = _t->maxBufferPoints(); break;
        case 8: *reinterpret_cast<int*>(_v) = _t->refreshMs(); break;
        case 9: *reinterpret_cast<bool*>(_v) = _t->paused(); break;
        case 10: *reinterpret_cast<QVariant*>(_v) = _t->initialXRange(); break;
        case 11: *reinterpret_cast<QVariant*>(_v) = _t->initialYRange(); break;
        case 12: *reinterpret_cast<QVariantMap*>(_v) = _t->graphs(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_backgroundColor(*reinterpret_cast<QColor*>(_v)); break;
        case 1: _t->set_labelColor(*reinterpret_cast<QColor*>(_v)); break;
        case 2: _t->set_baseColor(*reinterpret_cast<QColor*>(_v)); break;
        case 7: _t->setMaxBufferPoints(*reinterpret_cast<int*>(_v)); break;
        case 8: _t->setRefreshMs(*reinterpret_cast<int*>(_v)); break;
        case 9: _t->setPaused(*reinterpret_cast<bool*>(_v)); break;
        case 10: _t->setInitialXRange(*reinterpret_cast<QVariant*>(_v)); break;
        case 11: _t->setInitialYRange(*reinterpret_cast<QVariant*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::BasePlot::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::BasePlot::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot8BasePlotE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int QmlQCustomPlot::BasePlot::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 32)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 32;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 32)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 32;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void QmlQCustomPlot::BasePlot::backgroundColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void QmlQCustomPlot::BasePlot::labelColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1);
}

// SIGNAL 2
void QmlQCustomPlot::BasePlot::baseColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1);
}

// SIGNAL 3
void QmlQCustomPlot::BasePlot::xAxisChanged(QmlQCustomPlot::Axis * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1);
}

// SIGNAL 4
void QmlQCustomPlot::BasePlot::x1AxisChanged(QmlQCustomPlot::Axis * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1);
}

// SIGNAL 5
void QmlQCustomPlot::BasePlot::yAxisChanged(QmlQCustomPlot::Axis * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}

// SIGNAL 6
void QmlQCustomPlot::BasePlot::y1AxisChanged(QmlQCustomPlot::Axis * _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 6, nullptr, _t1);
}

// SIGNAL 7
void QmlQCustomPlot::BasePlot::graphsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void QmlQCustomPlot::BasePlot::rangeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void QmlQCustomPlot::BasePlot::maxBufferChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void QmlQCustomPlot::BasePlot::refreshMsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}

// SIGNAL 11
void QmlQCustomPlot::BasePlot::pausedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 11, nullptr);
}

// SIGNAL 12
void QmlQCustomPlot::BasePlot::initialXRangeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 12, nullptr);
}

// SIGNAL 13
void QmlQCustomPlot::BasePlot::initialYRangeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 13, nullptr);
}
QT_WARNING_POP
