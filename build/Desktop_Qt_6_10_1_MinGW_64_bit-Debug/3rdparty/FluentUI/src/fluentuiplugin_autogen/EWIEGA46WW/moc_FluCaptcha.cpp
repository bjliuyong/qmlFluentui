/****************************************************************************
** Meta object code from reading C++ file 'FluCaptcha.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluCaptcha.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluCaptcha.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN10FluCaptchaE_t {};
} // unnamed namespace

template <> constexpr inline auto FluCaptcha::qt_create_metaobjectdata<qt_meta_tag_ZN10FluCaptchaE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluCaptcha",
        "QML.Element",
        "fontChanged",
        "",
        "ignoreCaseChanged",
        "noiseCountChanged",
        "noiseRadiusChanged",
        "lineCountChanged",
        "lineWidthMinChanged",
        "lineWidthMaxChanged",
        "refresh",
        "verify",
        "code",
        "font",
        "QFont",
        "ignoreCase",
        "noiseCount",
        "noiseRadius",
        "lineCount",
        "lineWidthMin",
        "lineWidthMax"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'fontChanged'
        QtMocHelpers::SignalData<void()>(2, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'ignoreCaseChanged'
        QtMocHelpers::SignalData<void()>(4, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'noiseCountChanged'
        QtMocHelpers::SignalData<void()>(5, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'noiseRadiusChanged'
        QtMocHelpers::SignalData<void()>(6, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lineCountChanged'
        QtMocHelpers::SignalData<void()>(7, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lineWidthMinChanged'
        QtMocHelpers::SignalData<void()>(8, 3, QMC::AccessPublic, QMetaType::Void),
        // Signal 'lineWidthMaxChanged'
        QtMocHelpers::SignalData<void()>(9, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'refresh'
        QtMocHelpers::MethodData<void()>(10, 3, QMC::AccessPublic, QMetaType::Void),
        // Method 'verify'
        QtMocHelpers::MethodData<bool(const QString &)>(11, 3, QMC::AccessPublic, QMetaType::Bool, {{
            { QMetaType::QString, 12 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'font'
        QtMocHelpers::PropertyData<QFont>(13, 0x80000000 | 14, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 0),
        // property 'ignoreCase'
        QtMocHelpers::PropertyData<bool>(15, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'noiseCount'
        QtMocHelpers::PropertyData<int>(16, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'noiseRadius'
        QtMocHelpers::PropertyData<qreal>(17, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable, 3),
        // property 'lineCount'
        QtMocHelpers::PropertyData<int>(18, QMetaType::Int, QMC::DefaultPropertyFlags | QMC::Writable, 4),
        // property 'lineWidthMin'
        QtMocHelpers::PropertyData<qreal>(19, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable, 5),
        // property 'lineWidthMax'
        QtMocHelpers::PropertyData<qreal>(20, QMetaType::QReal, QMC::DefaultPropertyFlags | QMC::Writable, 6),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
    });
    return QtMocHelpers::metaObjectData<FluCaptcha, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluCaptcha::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickPaintedItem::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10FluCaptchaE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10FluCaptchaE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN10FluCaptchaE_t>.metaTypes,
    nullptr
} };

void FluCaptcha::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluCaptcha *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->fontChanged(); break;
        case 1: _t->ignoreCaseChanged(); break;
        case 2: _t->noiseCountChanged(); break;
        case 3: _t->noiseRadiusChanged(); break;
        case 4: _t->lineCountChanged(); break;
        case 5: _t->lineWidthMinChanged(); break;
        case 6: _t->lineWidthMaxChanged(); break;
        case 7: _t->refresh(); break;
        case 8: { bool _r = _t->verify((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::fontChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::ignoreCaseChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::noiseCountChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::noiseRadiusChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::lineCountChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::lineWidthMinChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluCaptcha::*)()>(_a, &FluCaptcha::lineWidthMaxChanged, 6))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QFont*>(_v) = _t->_font; break;
        case 1: *reinterpret_cast<bool*>(_v) = _t->_ignoreCase; break;
        case 2: *reinterpret_cast<int*>(_v) = _t->_noiseCount; break;
        case 3: *reinterpret_cast<qreal*>(_v) = _t->_noiseRadius; break;
        case 4: *reinterpret_cast<int*>(_v) = _t->_lineCount; break;
        case 5: *reinterpret_cast<qreal*>(_v) = _t->_lineWidthMin; break;
        case 6: *reinterpret_cast<qreal*>(_v) = _t->_lineWidthMax; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_font, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->fontChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_ignoreCase, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->ignoreCaseChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_noiseCount, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->noiseCountChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_noiseRadius, *reinterpret_cast<qreal*>(_v)))
                Q_EMIT _t->noiseRadiusChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_lineCount, *reinterpret_cast<int*>(_v)))
                Q_EMIT _t->lineCountChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_lineWidthMin, *reinterpret_cast<qreal*>(_v)))
                Q_EMIT _t->lineWidthMinChanged();
            break;
        case 6:
            if (QtMocHelpers::setProperty(_t->_lineWidthMax, *reinterpret_cast<qreal*>(_v)))
                Q_EMIT _t->lineWidthMaxChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluCaptcha::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluCaptcha::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN10FluCaptchaE_t>.strings))
        return static_cast<void*>(this);
    return QQuickPaintedItem::qt_metacast(_clname);
}

int FluCaptcha::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
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
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void FluCaptcha::fontChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluCaptcha::ignoreCaseChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluCaptcha::noiseCountChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluCaptcha::noiseRadiusChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluCaptcha::lineCountChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluCaptcha::lineWidthMinChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluCaptcha::lineWidthMaxChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}
QT_WARNING_POP
