/****************************************************************************
** Meta object code from reading C++ file 'FluWatermark.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluWatermark.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluWatermark.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN12FluWatermarkE_t {};
} // unnamed namespace

template <> constexpr inline auto FluWatermark::qt_create_metaobjectdata<qt_meta_tag_ZN12FluWatermarkE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluWatermark",
        "QML.Element",
        "textChanged",
        "",
        "gapChanged",
        "offsetChanged",
        "textColorChanged",
        "rotateChanged",
        "textSizeChanged",
        "text",
        "gap",
        "QPoint",
        "offset",
        "textColor",
        "QColor",
        "rotate",
        "textSize"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'textChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'gapChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'offsetChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'textColorChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'rotateChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'textSizeChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'text'
        QtMocHelpers::PropertyData<QString>(9, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'gap'
        QtMocHelpers::PropertyData<QPoint>(10, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'offset'
        QtMocHelpers::PropertyData<QPoint>(12, 0x80000000 | 11, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'textColor'
        QtMocHelpers::PropertyData<QColor>(13, 0x80000000 | 14, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'rotate'
        QtMocHelpers::PropertyData<int>(15, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 4),
        // property 'textSize'
        QtMocHelpers::PropertyData<int>(16, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 5),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluWatermark, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluWatermark::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluWatermarkE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluWatermarkE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12FluWatermarkE_t>.metaTypes,
    nullptr
} };

void FluWatermark::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluWatermark *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->textChanged(); break;
        case 1: _t->gapChanged(); break;
        case 2: _t->offsetChanged(); break;
        case 3: _t->textColorChanged(); break;
        case 4: _t->rotateChanged(); break;
        case 5: _t->textSizeChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::textChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::gapChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::offsetChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::textColorChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::rotateChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluWatermark::*)()>(_a, &FluWatermark::textSizeChanged, 5))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QString*>(_v) = _t->_text; break;
        case 1: *reinterpret_cast<QPoint*>(_v) = _t->_gap; break;
        case 2: *reinterpret_cast<QPoint*>(_v) = _t->_offset; break;
        case 3: *reinterpret_cast<QColor*>(_v) = _t->_textColor; break;
        case 4: *reinterpret_cast<int*>(_v) = _t->_rotate; break;
        case 5: *reinterpret_cast<int*>(_v) = _t->_textSize; break;
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
            if (QtMocHelpers::setProperty(_t->_gap, *reinterpret_cast<QPoint*>(_v)))
                Q_EMIT _t->gapChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_offset, *reinterpret_cast<QPoint*>(_v)))
                Q_EMIT _t->offsetChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_textColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->textColorChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_rotate, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->rotateChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_textSize, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->textSizeChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluWatermark::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluWatermark::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluWatermarkE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int FluWatermark::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
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
void FluWatermark::textChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluWatermark::gapChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluWatermark::offsetChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluWatermark::textColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluWatermark::rotateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluWatermark::textSizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
