/****************************************************************************
** Meta object code from reading C++ file 'FluTextStyle.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluTextStyle.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluTextStyle.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN12FluTextStyleE_t {};
} // unnamed namespace

template <> constexpr inline auto FluTextStyle::qt_create_metaobjectdata<qt_meta_tag_ZN12FluTextStyleE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluTextStyle",
        "QML.Element",
        "QML.Singleton",
        "true",
        "familyChanged",
        "",
        "CaptionChanged",
        "BodyChanged",
        "BodyStrongChanged",
        "SubtitleChanged",
        "TitleChanged",
        "TitleLargeChanged",
        "DisplayChanged",
        "family",
        "Caption",
        "QFont",
        "Body",
        "BodyStrong",
        "Subtitle",
        "Title",
        "TitleLarge",
        "Display"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'familyChanged'
        QtMocHelpers::SignalData<void()>(4, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'CaptionChanged'
        QtMocHelpers::SignalData<void()>(6, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'BodyChanged'
        QtMocHelpers::SignalData<void()>(7, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'BodyStrongChanged'
        QtMocHelpers::SignalData<void()>(8, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'SubtitleChanged'
        QtMocHelpers::SignalData<void()>(9, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'TitleChanged'
        QtMocHelpers::SignalData<void()>(10, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'TitleLargeChanged'
        QtMocHelpers::SignalData<void()>(11, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'DisplayChanged'
        QtMocHelpers::SignalData<void()>(12, 5, QMC::AccessPublic, QMetaType::Void),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'family'
        QtMocHelpers::PropertyData<QString>(13, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'Caption'
        QtMocHelpers::PropertyData<QFont>(14, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 1),
        // property 'Body'
        QtMocHelpers::PropertyData<QFont>(16, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 2),
        // property 'BodyStrong'
        QtMocHelpers::PropertyData<QFont>(17, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 3),
        // property 'Subtitle'
        QtMocHelpers::PropertyData<QFont>(18, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 4),
        // property 'Title'
        QtMocHelpers::PropertyData<QFont>(19, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 5),
        // property 'TitleLarge'
        QtMocHelpers::PropertyData<QFont>(20, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 6),
        // property 'Display'
        QtMocHelpers::PropertyData<QFont>(21, 0x80000000 | 15, QMC::DefaultPropertyFlags | QMC::Writable | QMC::EnumOrFlag, 7),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
            {    2,    3 },
    });
    return QtMocHelpers::metaObjectData<FluTextStyle, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluTextStyle::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTextStyleE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTextStyleE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN12FluTextStyleE_t>.metaTypes,
    nullptr
} };

void FluTextStyle::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluTextStyle *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->familyChanged(); break;
        case 1: _t->CaptionChanged(); break;
        case 2: _t->BodyChanged(); break;
        case 3: _t->BodyStrongChanged(); break;
        case 4: _t->SubtitleChanged(); break;
        case 5: _t->TitleChanged(); break;
        case 6: _t->TitleLargeChanged(); break;
        case 7: _t->DisplayChanged(); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::familyChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::CaptionChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::BodyChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::BodyStrongChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::SubtitleChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::TitleChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::TitleLargeChanged, 6))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluTextStyle::*)()>(_a, &FluTextStyle::DisplayChanged, 7))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QString*>(_v) = _t->_family; break;
        case 1: *reinterpret_cast<QFont*>(_v) = _t->_Caption; break;
        case 2: *reinterpret_cast<QFont*>(_v) = _t->_Body; break;
        case 3: *reinterpret_cast<QFont*>(_v) = _t->_BodyStrong; break;
        case 4: *reinterpret_cast<QFont*>(_v) = _t->_Subtitle; break;
        case 5: *reinterpret_cast<QFont*>(_v) = _t->_Title; break;
        case 6: *reinterpret_cast<QFont*>(_v) = _t->_TitleLarge; break;
        case 7: *reinterpret_cast<QFont*>(_v) = _t->_Display; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_family, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->familyChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_Caption, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->CaptionChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_Body, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->BodyChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_BodyStrong, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->BodyStrongChanged();
            break;
        case 4:
            if (QtMocHelpers::setProperty(_t->_Subtitle, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->SubtitleChanged();
            break;
        case 5:
            if (QtMocHelpers::setProperty(_t->_Title, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->TitleChanged();
            break;
        case 6:
            if (QtMocHelpers::setProperty(_t->_TitleLarge, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->TitleLargeChanged();
            break;
        case 7:
            if (QtMocHelpers::setProperty(_t->_Display, *reinterpret_cast<QFont*>(_v)))
                Q_EMIT _t->DisplayChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluTextStyle::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluTextStyle::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN12FluTextStyleE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluTextStyle::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void FluTextStyle::familyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluTextStyle::CaptionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluTextStyle::BodyChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluTextStyle::BodyStrongChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void FluTextStyle::SubtitleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void FluTextStyle::TitleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void FluTextStyle::TitleLargeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void FluTextStyle::DisplayChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}
QT_WARNING_POP
