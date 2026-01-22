/****************************************************************************
** Meta object code from reading C++ file 'FluTableSortProxyModel.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTableSortProxyModel.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTableSortProxyModel.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN22FluTableSortProxyModelE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTableSortProxyModel::qt_create_metaobjectdata<qt_meta_tag_ZN22FluTableSortProxyModelE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTableSortProxyModel",
        "QML.Element",
        "modelChanged",
        "",
        "getRow",
        "QVariant",
        "rowIndex",
        "setRow",
        "val",
        "insertRow",
        "removeRow",
        "rows",
        "setComparator",
        "QJSValue",
        "comparator",
        "setFilter",
        "filter",
        "model"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'modelChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'getRow'
        QtMocHelpers::MethodData<QVariant(int)>(4, 3, QMC::AccessPublic, 0x80000000 | 5, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'setRow'
        QtMocHelpers::MethodData<void(int, const QVariant &)>(7, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { 0x80000000 | 5, 8 },
        }}),
        // Method 'insertRow'
        QtMocHelpers::MethodData<void(int, const QVariant &)>(9, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { 0x80000000 | 5, 8 },
        }}),
        // Method 'removeRow'
        QtMocHelpers::MethodData<void(int, int)>(10, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { QMetaType::Int, 11 },
        }}),
        // Method 'setComparator'
        QtMocHelpers::MethodData<void(const QJSValue &)>(12, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 13, 14 },
        }}),
        // Method 'setFilter'
        QtMocHelpers::MethodData<void(const QJSValue &)>(15, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 13, 16 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'model'
        QtMocHelpers::PropertyData<QVariant>(17, 0x80000000 | 5, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluTableSortProxyModel, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTableSortProxyModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QSortFilterProxyModel::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN22FluTableSortProxyModelE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN22FluTableSortProxyModelE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN22FluTableSortProxyModelE_t>.metaTypes,
    nullptr
} };

void FluTableSortProxyModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTableSortProxyModel *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->modelChanged(); break;
        case 1: { QVariant _r = _t->getRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QVariant*>(_a[0]) = std::move(_r); }  break;
        case 2: _t->setRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QVariant>>(_a[2]))); break;
        case 3: _t->insertRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QVariant>>(_a[2]))); break;
        case 4: _t->removeRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<int>>(_a[2]))); break;
        case 5: _t->setComparator((*reinterpret_cast<std::add_pointer_t<QJSValue>>(_a[1]))); break;
        case 6: _t->setFilter((*reinterpret_cast<std::add_pointer_t<QJSValue>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QJSValue >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QJSValue >(); break;
            }
            break;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluTableSortProxyModel::*)()>(_a, &FluTableSortProxyModel::modelChanged, 0))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QVariant*>(_v) = _t->_model; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_model, *reinterpret_cast<QVariant*>(_v)))
                Q_EMIT _t->modelChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluTableSortProxyModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTableSortProxyModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN22FluTableSortProxyModelE_t>.strings))
        return static_cast<void*>(this);
    return QSortFilterProxyModel::qt_metacast(_clname);
}

int FluTableSortProxyModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QSortFilterProxyModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
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
void FluTableSortProxyModel::modelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
