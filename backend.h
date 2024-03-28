#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QDBusInterface>
#include <QDebug>

class Backend : public QObject
{
    Q_OBJECT
public:
    Backend();
    Q_INVOKABLE void logout();
};

#endif // BACKEND_H
