/****************************************************************************
** Meta object code from reading C++ file 'graph.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/qmlcustomplot/graph.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'graph.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t {};
} // unnamed namespace

template <> constexpr inline auto QmlQCustomPlot::Graph::qt_create_metaobjectdata<qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "QmlQCustomPlot::Graph",
        "visibleChanged",
        "",
        "antialiasedChanged",
        "nameChanged",
        "lineStyleChanged",
        "LineStyle",
        "graphWidthChanged",
        "graphColorChanged",
        "QColor",
        "setData",
        "QList<double>",
        "keys",
        "values",
        "alreadySorted",
        "addDatas",
        "addData",
        "key",
        "value",
        "removeDataBefore",
        "clearData",
        "visible",
        "antialiased",
        "name",
        "lineStyle",
        "graphWidth",
        "graphColor"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'visibleChanged'
        QtMocHelpers::SignalData<void(bool)>(1, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 2 },
        }}),
        // Signal 'antialiasedChanged'
        QtMocHelpers::SignalData<void(bool)>(3, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Bool, 2 },
        }}),
        // Signal 'nameChanged'
        QtMocHelpers::SignalData<void(QString)>(4, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 2 },
        }}),
        // Signal 'lineStyleChanged'
        QtMocHelpers::SignalData<void(enum LineStyle)>(5, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 6, 2 },
        }}),
        // Signal 'graphWidthChanged'
        QtMocHelpers::SignalData<void(int)>(7, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 2 },
        }}),
        // Signal 'graphColorChanged'
        QtMocHelpers::SignalData<void(QColor)>(8, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 2 },
        }}),
        // Method 'setData'
        QtMocHelpers::MethodData<void(const QVector<double> &, const QVector<double> &)>(10, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 11, 12 }, { 0x80000000 | 11, 13 },
        }}),
        // Method 'setData'
        QtMocHelpers::MethodData<void(const QVector<double> &, const QVector<double> &, bool)>(10, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 11, 12 }, { 0x80000000 | 11, 13 }, { QMetaType::Bool, 14 },
        }}),
        // Method 'addDatas'
        QtMocHelpers::MethodData<void(const QVector<double> &, const QVector<double> &, bool)>(15, 2, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 11, 12 }, { 0x80000000 | 11, 13 }, { QMetaType::Bool, 14 },
        }}),
        // Method 'addData'
        QtMocHelpers::MethodData<void(double, double)>(16, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 17 }, { QMetaType::Double, 18 },
        }}),
        // Method 'removeDataBefore'
        QtMocHelpers::MethodData<void(double)>(19, 2, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Double, 17 },
        }}),
        // Method 'clearData'
        QtMocHelpers::MethodData<void()>(20, 2, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'visible'
        QtMocHelpers::PropertyData<bool>(21, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'antialiased'
        QtMocHelpers::PropertyData<bool>(22, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'name'
        QtMocHelpers::PropertyData<QString>(23, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'lineStyle'
        QtMocHelpers::PropertyData<enum LineStyle>(24, 0x80000000 | 6, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'graphWidth'
        QtMocHelpers::PropertyData<int>(25, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 4),
        // property 'graphColor'
        QtMocHelpers::PropertyData<QColor>(26, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<Graph, qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject QmlQCustomPlot::Graph::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>.metaTypes,
    nullptr
} };

void QmlQCustomPlot::Graph::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<Graph *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->visibleChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 1: _t->antialiasedChanged((*reinterpret_cast<std::add_pointer_t<bool>>(_a[1]))); break;
        case 2: _t->nameChanged((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        case 3: _t->lineStyleChanged((*reinterpret_cast<std::add_pointer_t<enum LineStyle>>(_a[1]))); break;
        case 4: _t->graphWidthChanged((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 5: _t->graphColorChanged((*reinterpret_cast<std::add_pointer_t<QColor>>(_a[1]))); break;
        case 6: _t->setData((*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[2]))); break;
        case 7: _t->setData((*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[3]))); break;
        case 8: _t->addDatas((*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<double>>>(_a[2])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[3]))); break;
        case 9: _t->addData((*reinterpret_cast<std::add_pointer_t<double>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<double>>(_a[2]))); break;
        case 10: _t->removeDataBefore((*reinterpret_cast<std::add_pointer_t<double>>(_a[1]))); break;
        case 11: _t->clearData(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 1:
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<double> >(); break;
            }
            break;
        case 7:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 1:
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<double> >(); break;
            }
            break;
        case 8:
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
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(bool )>(_a, &Graph::visibleChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(bool )>(_a, &Graph::antialiasedChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(QString )>(_a, &Graph::nameChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(LineStyle )>(_a, &Graph::lineStyleChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(int )>(_a, &Graph::graphWidthChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (Graph::*)(QColor )>(_a, &Graph::graphColorChanged, 5))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->visible(); break;
        case 1: *reinterpret_cast<bool*>(_v) = _t->antialiased(); break;
        case 2: *reinterpret_cast<QString*>(_v) = _t->name(); break;
        case 3: *reinterpret_cast<enum LineStyle*>(_v) = _t->lineStyle(); break;
        case 4: *reinterpret_cast<int*>(_v) = _t->graphWidth(); break;
        case 5: *reinterpret_cast<QColor*>(_v) = _t->graphColor(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->set_visible(*reinterpret_cast<bool*>(_v)); break;
        case 1: _t->set_antialiased(*reinterpret_cast<bool*>(_v)); break;
        case 2: _t->set_name(*reinterpret_cast<QString*>(_v)); break;
        case 3: _t->set_lineStyle(*reinterpret_cast<enum LineStyle*>(_v)); break;
        case 4: _t->set_graphWidth(*reinterpret_cast<int*>(_v)); break;
        case 5: _t->set_graphColor(*reinterpret_cast<QColor*>(_v)); break;
        default: break;
        }
    }
}

const QMetaObject *QmlQCustomPlot::Graph::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlQCustomPlot::Graph::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN14QmlQCustomPlot5GraphE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlQCustomPlot::Graph::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
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
void QmlQCustomPlot::Graph::visibleChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 0, nullptr, _t1);
}

// SIGNAL 1
void QmlQCustomPlot::Graph::antialiasedChanged(bool _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 1, nullptr, _t1);
}

// SIGNAL 2
void QmlQCustomPlot::Graph::nameChanged(QString _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 2, nullptr, _t1);
}

// SIGNAL 3
void QmlQCustomPlot::Graph::lineStyleChanged(LineStyle _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 3, nullptr, _t1);
}

// SIGNAL 4
void QmlQCustomPlot::Graph::graphWidthChanged(int _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 4, nullptr, _t1);
}

// SIGNAL 5
void QmlQCustomPlot::Graph::graphColorChanged(QColor _t1)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 5, nullptr, _t1);
}
QT_WARNING_POP
