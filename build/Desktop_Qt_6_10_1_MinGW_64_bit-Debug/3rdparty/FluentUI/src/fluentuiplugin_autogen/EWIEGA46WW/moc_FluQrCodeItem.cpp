/****************************************************************************
** Meta object code from reading C++ file 'FluQrCodeItem.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluQrCodeItem.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluQrCodeItem.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN13FluQrCodeItemE_t {};
} // unnamed namespace

template <> constexpr inline auto FluQrCodeItem::qt_create_metaobjectdata<qt_meta_tag_ZN13FluQrCodeItemE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluQrCodeItem",
        "QML.Element",
        "textChanged",
        "",
        "colorChanged",
        "bgColorChanged",
        "sizeChanged",
        "text",
        "color",
        "QColor",
        "bgColor",
        "size"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'textChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'colorChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'bgColorChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'sizeChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'text'
        QtMocHelpers::PropertyData<QString>(7, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'color'
        QtMocHelpers::PropertyData<QColor>(8, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'bgColor'
        QtMocHelpers::PropertyData<QColor>(10, 0x80000000 | 9, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'size'
        QtMocHelpers::PropertyData<int>(11, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 3),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluQrCodeItem, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluQrCodeItem::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluQrCodeItemE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluQrCodeItemE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN13FluQrCodeItemE_t>.metaTypes,
    nullptr
} };

void FluQrCodeItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluQrCodeItem *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->textChanged(); break;
        case 1: _t->colorChanged(); break;
        case 2: _t->bgColorChanged(); break;
        case 3: _t->sizeChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluQrCodeItem::*)()>(_a, &FluQrCodeItem::textChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluQrCodeItem::*)()>(_a, &FluQrCodeItem::colorChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluQrCodeItem::*)()>(_a, &FluQrCodeItem::bgColorChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluQrCodeItem::*)()>(_a, &FluQrCodeItem::sizeChanged, 3))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QString*>(_v) = _t->_text; break;
        case 1: *reinterpret_cast<QColor*>(_v) = _t->_color; break;
        case 2: *reinterpret_cast<QColor*>(_v) = _t->_bgColor; break;
        case 3: *reinterpret_cast<int*>(_v) = _t->_size; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_text, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->textChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_color, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->colorChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_bgColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->bgColorChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_size, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->sizeChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluQrCodeItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluQrCodeItem::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN13FluQrCodeItemE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int FluQrCodeItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 4;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void FluQrCodeItem::textChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluQrCodeItem::colorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluQrCodeItem::bgColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluQrCodeItem::sizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
