/****************************************************************************
** Meta object code from reading C++ file 'FluTableModel.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTableModel.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTableModel.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN13FluTableModelE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTableModel::qt_create_metaobjectdata<qt_meta_tag_ZN13FluTableModelE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTableModel",
        "QML.Element",
        "columnSourceChanged",
        "",
        "rowsChanged",
        "clear",
        "getRow",
        "QVariant",
        "rowIndex",
        "setRow",
        "row",
        "insertRow",
        "removeRow",
        "rows",
        "appendRow",
        "columnSource",
        "QList<QVariantMap>",
        "rowCount"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'columnSourceChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'rowsChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'clear'
        QtMocHelpers::MethodData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'getRow'
        QtMocHelpers::MethodData<QVariant(int)>(6, 3, QMC::AccessPublic, 0x80000000 | 7, {{
            { QMetaType::Int, 8 },
        }}),
        // Method 'setRow'
        QtMocHelpers::MethodData<void(int, QVariant)>(9, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 8 }, { 0x80000000 | 7, 10 },
        }}),
        // Method 'insertRow'
        QtMocHelpers::MethodData<void(int, QVariant)>(11, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 8 }, { 0x80000000 | 7, 10 },
        }}),
        // Method 'removeRow'
        QtMocHelpers::MethodData<void(int, int)>(12, 3, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::Int, 8 }, { QMetaType::Int, 13 },
        }}),
        // Method 'removeRow'
        QtMocHelpers::MethodData<void(int)>(12, 3, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void, {{
            { QMetaType::Int, 8 },
        }}),
        // Method 'appendRow'
        QtMocHelpers::MethodData<void(QVariant)>(14, 3, QMC::AccessPublic, QMetaType::Void, {{
            { 0x80000000 | 7, 10 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'columnSource'
        QtMocHelpers::PropertyData<QList<QVariantMap>>(15, 0x80000000 | 16, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'rows'
        QtMocHelpers::PropertyData<QList<QVariantMap>>(13, 0x80000000 | 16, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'rowCount'
        QtMocHelpers::PropertyData<int>(17, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Constant),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluTableModel, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTableModel::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractTableModel::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluTableModelE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluTableModelE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN13FluTableModelE_t>.metaTypes,
    nullptr
} };

void FluTableModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTableModel *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->columnSourceChanged(); break;
        case 1: _t->rowsChanged(); break;
        case 2: _t->clear(); break;
        case 3: { QVariant _r = _t->getRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QVariant*>(_a[0]) = std::move(_r); }  break;
        case 4: _t->setRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QVariant>>(_a[2]))); break;
        case 5: _t->insertRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QVariant>>(_a[2]))); break;
        case 6: _t->removeRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<int>>(_a[2]))); break;
        case 7: _t->removeRow((*reinterpret_cast<std::add_pointer_t<int>>(_a[1]))); break;
        case 8: _t->appendRow((*reinterpret_cast<std::add_pointer_t<QVariant>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluTableModel::*)()>(_a, &FluTableModel::columnSourceChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTableModel::*)()>(_a, &FluTableModel::rowsChanged, 1))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QList<QVariantMap>*>(_v) = _t->_columnSource; break;
        case 1: *reinterpret_cast<QList<QVariantMap>*>(_v) = _t->_rows; break;
        case 2: *reinterpret_cast<int*>(_v) = _t->rowCount(); break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_columnSource, *reinterpret_cast<QList<QVariantMap>*>(_v)))
                Q_EMIT _t->columnSourceChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_rows, *reinterpret_cast<QList<QVariantMap>*>(_v)))
                Q_EMIT _t->rowsChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluTableModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTableModel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluTableModelE_t>.strings))
        return static_cast<void*>(this);
    return QAbstractTableModel::qt_metacast(_clname);
}

int FluTableModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractTableModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 9;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void FluTableModel::columnSourceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluTableModel::rowsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
