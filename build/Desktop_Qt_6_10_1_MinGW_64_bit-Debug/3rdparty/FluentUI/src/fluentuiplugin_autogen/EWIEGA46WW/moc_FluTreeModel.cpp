/****************************************************************************
** Meta object code from reading C++ file 'FluTreeModel.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTreeModel.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTreeModel.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN11FluTreeNodeE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTreeNode::qt_create_metaobjectdata<qt_meta_tag_ZN11FluTreeNodeE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTreeNode",
        "depth",
        "",
        "isExpanded",
        "data",
        "QVariantMap",
        "hasChildren",
        "hasNextNodeByIndex",
        "index",
        "checked",
        "hideLineFooter"
    };

    QtMocHelpers::UintData qt_methods {
        // Method 'depth'
        QtMocHelpers::MethodData<int() const>(1, 2, QMC::AccessPublic, QMetaType::Int),
        // Method 'isExpanded'
        QtMocHelpers::MethodData<bool() const>(3, 2, QMC::AccessPublic, QMetaType::Bool),
        // Method 'data'
        QtMocHelpers::MethodData<QVariantMap() const>(4, 2, QMC::AccessPublic, 0x80000000 | 5),
        // Method 'hasChildren'
        QtMocHelpers::MethodData<bool() const>(6, 2, QMC::AccessPublic, QMetaType::Bool),
        // Method 'hasNextNodeByIndex'
        QtMocHelpers::MethodData<bool(int)>(7, 2, QMC::AccessPublic, QMetaType::Bool, {{
            { QMetaType::Int, 8 },
        }}),
        // Method 'checked'
        QtMocHelpers::MethodData<bool() const>(9, 2, QMC::AccessPublic, QMetaType::Bool),
        // Method 'hideLineFooter'
        QtMocHelpers::MethodData<bool()>(10, 2, QMC::AccessPublic, QMetaType::Bool),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'data'
        QtMocHelpers::PropertyData<QVariantMap>(4, 0x80000000 | 5, QMC::DefaultPropertyFlags | QMC::EnumOrFlag | QMC::Constant),
        // property 'depth'
        QtMocHelpers::PropertyData<int>(1, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Constant),
        // property 'isExpanded'
        QtMocHelpers::PropertyData<bool>(3, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Constant),
        // property 'checked'
        QtMocHelpers::PropertyData<bool>(9, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Constant),
    };
    QtMocHelpers::UintData qt_enums {
    };
    return QtMocHelpers::metaObjectData<FluTreeNode, qt_meta_tag_ZN11FluTreeNodeE_t>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums);
}
Q_CONSTINIT const QMetaObject FluTreeNode::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11FluTreeNodeE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11FluTreeNodeE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN11FluTreeNodeE_t>.metaTypes,
    nullptr
} };

void FluTreeNode::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTreeNode *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { int _r = _t->depth();
            if (_a[0]) *reinterpret_cast<int*>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->isExpanded();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { QVariantMap _r = _t->data();
            if (_a[0]) *reinterpret_cast<QVariantMap*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->hasChildren();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->hasNextNodeByIndex((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 5: { bool _r = _t->checked();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 6: { bool _r = _t->hideLineFooter();
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QVariantMap*>(_v) = _t->data(); break;
        case 1: *reinterpret_cast<int*>(_v) = _t->depth(); break;
        case 2: *reinterpret_cast<bool*>(_v) = _t->isExpanded(); break;
        case 3: *reinterpret_cast<bool*>(_v) = _t->checked(); break;
        default: break;
        }
    }
}

const QMetaObject *FluTreeNode::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTreeNode::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN11FluTreeNodeE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluTreeNode::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        _id -= 4;
    }
    return _id;
}
namespace {
struct qt_meta_tag_ZN12FluTreeModelE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTreeModel::qt_create_metaobjectdata<qt_meta_tag_ZN12FluTreeModelE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTreeModel",
        "QML.Element",
        "dataSourceSizeChanged",
        "",
        "columnSourceChanged",
        "removeRows",
        "row",
        "count",
        "insertRows",
        "QList<FluTreeNode*>",
        "data",
        "getRow",
        "setRow",
        "QVariantMap",
        "setData",
        "setDataSource",
        "QList<QMap<QString,QVariant>>",
        "collapse",
        "expand",
        "getNode",
        "FluTreeNode*",
        "refreshNode",
        "checkRow",
        "checked",
        "hitHasChildrenExpanded",
        "allExpand",
        "allCollapse",
        "selectionModel",
        "QVariant",
        "dataSourceSize",
        "columnSource",
        "QList<QVariantMap>"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'dataSourceSizeChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'columnSourceChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'removeRows'
        QtMocHelpers::MethodData<void(int, int)>(5, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { QMetaType::Int, 7 },
        }}),
        // Method 'insertRows'
        QtMocHelpers::MethodData<void(int, const QList<FluTreeNode*> &)>(8, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { 0x80000000 | 9, 10 },
        }}),
        // Method 'getRow'
        QtMocHelpers::MethodData<QObject *(int)>(11, 3, QMC::AccessPublic, QMetaType::QObjectStar, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'setRow'
        QtMocHelpers::MethodData<void(int, QVariantMap)>(12, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { 0x80000000 | 13, 10 },
        }}),
        // Method 'setData'
        QtMocHelpers::MethodData<void(QList<FluTreeNode*>)>(14, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 9, 10 },
        }}),
        // Method 'setDataSource'
        QtMocHelpers::MethodData<void(QList<QMap<QString,QVariant>>)>(15, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 16, 10 },
        }}),
        // Method 'collapse'
        QtMocHelpers::MethodData<void(int)>(17, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'expand'
        QtMocHelpers::MethodData<void(int)>(18, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'getNode'
        QtMocHelpers::MethodData<FluTreeNode *(int)>(19, 3, QMC::AccessPublic, 0x80000000 | 20, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'refreshNode'
        QtMocHelpers::MethodData<void(int)>(21, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'checkRow'
        QtMocHelpers::MethodData<void(int, bool)>(22, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 6 }, { QMetaType::Bool, 23 },
        }}),
        // Method 'hitHasChildrenExpanded'
        QtMocHelpers::MethodData<bool(int)>(24, 3, QMC::AccessPublic, QMetaType::Bool, {{
            { QMetaType::Int, 6 },
        }}),
        // Method 'allExpand'
        QtMocHelpers::MethodData<void()>(25, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'allCollapse'
        QtMocHelpers::MethodData<void()>(26, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'selectionModel'
        QtMocHelpers::MethodData<QVariant()>(27, 3, QMC::AccessPublic, 0x80000000 | 28),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'dataSourceSize'
        QtMocHelpers::PropertyData<int>(29, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'columnSource'
        QtMocHelpers::PropertyData<QList<QVariantMap>>(30, 0x80000000 | 31, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluTreeModel, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTreeModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractTableModel::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTreeModelE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTreeModelE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12FluTreeModelE_t>.metaTypes,
    nullptr
} };

void FluTreeModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTreeModel *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->dataSourceSizeChanged(); break;
        case 1: _t->columnSourceChanged(); break;
        case 2: _t->removeRows((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<int>>(_a[2]))); break;
        case 3: _t->insertRows((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QList<FluTreeNode*>>>(_a[2]))); break;
        case 4: { QObject* _r = _t->getRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = std::move(_r); }  break;
        case 5: _t->setRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QVariantMap>>(_a[2]))); break;
        case 6: _t->setData((*reinterpret_cast<std::add_pointer_t<QList<FluTreeNode*>>>(_a[1]))); break;
        case 7: _t->setDataSource((*reinterpret_cast<std::add_pointer_t<QList<QMap<QString,QVariant>>>>(_a[1]))); break;
        case 8: _t->collapse((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 9: _t->expand((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 10: { FluTreeNode* _r = _t->getNode((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<FluTreeNode**>(_a[0]) = std::move(_r); }  break;
        case 11: _t->refreshNode((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 12: _t->checkRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[2]))); break;
        case 13: { bool _r = _t->hitHasChildrenExpanded((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        case 14: _t->allExpand(); break;
        case 15: _t->allCollapse(); break;
        case 16: { QVariant _r = _t->selectionModel();
            if (_a[0]) *reinterpret_cast<QVariant*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 1:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<FluTreeNode*> >(); break;
            }
            break;
        case 6:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QList<FluTreeNode*> >(); break;
            }
            break;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluTreeModel::*)()>(_a, &FluTreeModel::dataSourceSizeChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTreeModel::*)()>(_a, &FluTreeModel::columnSourceChanged, 1))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<int*>(_v) = _t->_dataSourceSize; break;
        case 1: *reinterpret_cast<QList<QVariantMap>*>(_v) = _t->_columnSource; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_dataSourceSize, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->dataSourceSizeChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_columnSource, *reinterpret_cast<QList<QVariantMap>*>(_v)))
                Q_EMIT _t->columnSourceChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluTreeModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTreeModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTreeModelE_t>.strings))
        return static_cast<void*>(this);
    return QAbstractTableModel::qt_metacast(_clname);
}

int FluTreeModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractTableModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void FluTreeModel::dataSourceSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluTreeModel::columnSourceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
