/****************************************************************************
** Meta object code from reading C++ file 'Connector.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../itemLists/Connector.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'Connector.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Connector_t {
    QByteArrayData data[9];
    char stringdata0[104];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Connector_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Connector_t qt_meta_stringdata_Connector = {
    {
QT_MOC_LITERAL(0, 0, 9), // "Connector"
QT_MOC_LITERAL(1, 10, 12), // "sg_checkTime"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 15), // "slot_startTimer"
QT_MOC_LITERAL(4, 40, 14), // "slot_stopTimer"
QT_MOC_LITERAL(5, 55, 15), // "getItemListSize"
QT_MOC_LITERAL(6, 71, 13), // "getPhotoTitle"
QT_MOC_LITERAL(7, 85, 5), // "index"
QT_MOC_LITERAL(8, 91, 12) // "getPhotoPath"

    },
    "Connector\0sg_checkTime\0\0slot_startTimer\0"
    "slot_stopTimer\0getItemListSize\0"
    "getPhotoTitle\0index\0getPhotoPath"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Connector[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       3,    0,   45,    2, 0x08 /* Private */,
       4,    0,   46,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
       5,    0,   47,    2, 0x02 /* Public */,
       6,    1,   48,    2, 0x02 /* Public */,
       8,    1,   51,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Int,
    QMetaType::QString, QMetaType::Int,    7,
    QMetaType::QString, QMetaType::Int,    7,

       0        // eod
};

void Connector::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Connector *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sg_checkTime(); break;
        case 1: _t->slot_startTimer(); break;
        case 2: _t->slot_stopTimer(); break;
        case 3: { int _r = _t->getItemListSize();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 4: { QString _r = _t->getPhotoTitle((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 5: { QString _r = _t->getPhotoPath((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Connector::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Connector::sg_checkTime)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Connector::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_Connector.data,
    qt_meta_data_Connector,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Connector::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Connector::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Connector.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Connector::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void Connector::sg_checkTime()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
