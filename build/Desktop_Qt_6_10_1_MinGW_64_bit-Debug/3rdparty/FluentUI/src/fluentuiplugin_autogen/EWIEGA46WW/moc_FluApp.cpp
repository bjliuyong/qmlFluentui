/****************************************************************************
** Meta object code from reading C++ file 'FluApp.h'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../3rdparty/FluentUI/src/FluApp.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'FluApp.h' doesn't include <QObject>."
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
struct qt_meta_tag_ZN6FluAppE_t {};
} // unnamed namespace

template <> constexpr inline auto FluApp::qt_create_metaobjectdata<qt_meta_tag_ZN6FluAppE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "FluApp",
        "QML.Element",
        "QML.Singleton",
        "true",
        "useSystemAppBarChanged",
        "",
        "windowIconChanged",
        "localeChanged",
        "launcherChanged",
        "init",
        "launcher",
        "locale",
        "iconData",
        "QJsonArray",
        "keyword",
        "caseSensitive",
        "useSystemAppBar",
        "windowIcon"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'useSystemAppBarChanged'
        QtMocHelpers::SignalData<void()>(4, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'windowIconChanged'
        QtMocHelpers::SignalData<void()>(6, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'localeChanged'
        QtMocHelpers::SignalData<void()>(7, 5, QMC::AccessPublic, QMetaType::Void),
        // Signal 'launcherChanged'
        QtMocHelpers::SignalData<void()>(8, 5, QMC::AccessPublic, QMetaType::Void),
        // Method 'init'
        QtMocHelpers::MethodData<void(QObject *, QLocale)>(9, 5, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QObjectStar, 10 }, { QMetaType::QLocale, 11 },
        }}),
        // Method 'init'
        QtMocHelpers::MethodData<void(QObject *)>(9, 5, QMC::AccessPublic | QMC::MethodCloned, QMetaType::Void, {{
            { QMetaType::QObjectStar, 10 },
        }}),
        // Method 'iconData'
        QtMocHelpers::MethodData<QJsonArray(const QString &, bool)>(12, 5, QMC::AccessPublic, 0x80000000 | 13, {{
            { QMetaType::QString, 14 }, { QMetaType::Bool, 15 },
        }}),
        // Method 'iconData'
        QtMocHelpers::MethodData<QJsonArray(const QString &)>(12, 5, QMC::AccessPublic | QMC::MethodCloned, 0x80000000 | 13, {{
            { QMetaType::QString, 14 },
        }}),
        // Method 'iconData'
        QtMocHelpers::MethodData<QJsonArray()>(12, 5, QMC::AccessPublic | QMC::MethodCloned, 0x80000000 | 13),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'useSystemAppBar'
        QtMocHelpers::PropertyData<bool>(16, QMetaType::Bool, QMC::DefaultPropertyFlags | QMC::Writable, 0),
        // property 'windowIcon'
        QtMocHelpers::PropertyData<QString>(17, QMetaType::QString, QMC::DefaultPropertyFlags | QMC::Writable, 1),
        // property 'locale'
        QtMocHelpers::PropertyData<QLocale>(11, QMetaType::QLocale, QMC::DefaultPropertyFlags | QMC::Writable, 2),
        // property 'launcher'
        QtMocHelpers::PropertyData<QObject*>(10, QMetaType::QObjectStar, QMC::DefaultPropertyFlags | QMC::Writable, 3),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    0 },
            {    2,    3 },
    });
    return QtMocHelpers::metaObjectData<FluApp, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject FluApp::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN6FluAppE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN6FluAppE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN6FluAppE_t>.metaTypes,
    nullptr
} };

void FluApp::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<FluApp *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->useSystemAppBarChanged(); break;
        case 1: _t->windowIconChanged(); break;
        case 2: _t->localeChanged(); break;
        case 3: _t->launcherChanged(); break;
        case 4: _t->init((*reinterpret_cast<std::add_pointer_t<QObject*>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QLocale>>(_a[2]))); break;
        case 5: _t->init((*reinterpret_cast<std::add_pointer_t<QObject*>>(_a[1]))); break;
        case 6: { QJsonArray _r = _t->iconData((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<bool>>(_a[2])));
            if (_a[0]) *reinterpret_cast<QJsonArray*>(_a[0]) = std::move(_r); }  break;
        case 7: { QJsonArray _r = _t->iconData((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QJsonArray*>(_a[0]) = std::move(_r); }  break;
        case 8: { QJsonArray _r = _t->iconData();
            if (_a[0]) *reinterpret_cast<QJsonArray*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (FluApp::*)()>(_a, &FluApp::useSystemAppBarChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluApp::*)()>(_a, &FluApp::windowIconChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluApp::*)()>(_a, &FluApp::localeChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (FluApp::*)()>(_a, &FluApp::launcherChanged, 3))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<bool*>(_v) = _t->_useSystemAppBar; break;
        case 1: *reinterpret_cast<QString*>(_v) = _t->_windowIcon; break;
        case 2: *reinterpret_cast<QLocale*>(_v) = _t->_locale; break;
        case 3: *reinterpret_cast<QObject**>(_v) = _t->_launcher; break;
        default: break;
        }
    }
    if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0:
            if (QtMocHelpers::setProperty(_t->_useSystemAppBar, *reinterpret_cast<bool*>(_v)))
                Q_EMIT _t->useSystemAppBarChanged();
            break;
        case 1:
            if (QtMocHelpers::setProperty(_t->_windowIcon, *reinterpret_cast<QString*>(_v)))
                Q_EMIT _t->windowIconChanged();
            break;
        case 2:
            if (QtMocHelpers::setProperty(_t->_locale, *reinterpret_cast<QLocale*>(_v)))
                Q_EMIT _t->localeChanged();
            break;
        case 3:
            if (QtMocHelpers::setProperty(_t->_launcher, *reinterpret_cast<QObject**>(_v)))
                Q_EMIT _t->launcherChanged();
            break;
        default: break;
        }
    }
}

const QMetaObject *FluApp::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FluApp::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN6FluAppE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int FluApp::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
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
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void FluApp::useSystemAppBarChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void FluApp::windowIconChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void FluApp::localeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void FluApp::launcherChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
