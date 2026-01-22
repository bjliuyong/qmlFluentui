/****************************************************************************
** Meta object code from reading C++ file 'FluRectangle.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluRectangle.h"
#include <QtCore/qmetatype.h>
#include <QtCore/QList>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluRectangle.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN12FluRectangleE_t {};
} // unnamed namespace

template <> constexpr inline auto FluRectangle::qt_create_metaobjectdata<qt_meta_tag_ZN12FluRectangleE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluRectangle",
        "QML.Element",
        "colorChanged",
        "",
        "radiusChanged",
        "borderWidthChanged",
        "borderColorChanged",
        "borderStyleChanged",
        "dashPatternChanged",
        "color",
        "QColor",
        "radius",
        "QList<int>",
        "borderWidth",
        "borderColor",
        "borderStyle",
        "Qt::PenStyle",
        "dashPattern",
        "QList<qreal>"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'colorChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'radiusChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'borderWidthChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'borderColorChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'borderStyleChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'dashPatternChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'color'
        QtMocHelpers::PropertyData<QColor>(9, 0x80000000 | 10, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'radius'
        QtMocHelpers::PropertyData<QList<int>>(11, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'borderWidth'
        QtMocHelpers::PropertyData<qreal>(13, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'borderColor'
        QtMocHelpers::PropertyData<QColor>(14, 0x80000000 | 10, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'borderStyle'
        QtMocHelpers::PropertyData<Qt::PenStyle>(15, 0x80000000 | 16, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'dashPattern'
        QtMocHelpers::PropertyData<QList<qreal>>(17, 0x80000000 | 18, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluRectangle, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluRectangle::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluRectangleE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluRectangleE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12FluRectangleE_t>.metaTypes,
    nullptr
} };

void FluRectangle::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluRectangle *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->colorChanged(); break;
        case 1: _t->radiusChanged(); break;
        case 2: _t->borderWidthChanged(); break;
        case 3: _t->borderColorChanged(); break;
        case 4: _t->borderStyleChanged(); break;
        case 5: _t->dashPatternChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::colorChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::radiusChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::borderWidthChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::borderColorChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::borderStyleChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluRectangle::*)()>(_a, &FluRectangle::dashPatternChanged, 5))
            return;
    }
    if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
        case 5:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<qreal> >(); break;
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QColor*>(_v) = _t->_color; break;
        case 1: *reinterpret_cast<QList<int>*>(_v) = _t->_radius; break;
        case 2: *reinterpret_cast<qreal*>(_v) = _t->_borderWidth; break;
        case 3: *reinterpret_cast<QColor*>(_v) = _t->_borderColor; break;
        case 4: *reinterpret_cast<Qt::PenStyle*>(_v) = _t->_borderStyle; break;
        case 5: *reinterpret_cast<QList<qreal>*>(_v) = _t->_dashPattern; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_color, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->colorChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_radius, *reinterpret_cast<QList<int>*>(_v)))
                Q_EMIT _t->radiusChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_borderWidth, *reinterpret_cast<qreal*>(_v)))
                Q_EMIT _t->borderWidthChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_borderColor, *reinterpret_cast<QColor*>(_v)))
                Q_EMIT _t->borderColorChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_borderStyle, *reinterpret_cast<Qt::PenStyle*>(_v)))
                Q_EMIT _t->borderStyleChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_dashPattern, *reinterpret_cast<QList<qreal>*>(_v)))
                Q_EMIT _t->dashPatternChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluRectangle::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluRectangle::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluRectangleE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int FluRectangle::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void FluRectangle::colorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluRectangle::radiusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluRectangle::borderWidthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluRectangle::borderColorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluRectangle::borderStyleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluRectangle::dashPatternChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
