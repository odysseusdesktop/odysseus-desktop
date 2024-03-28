#include "backend.h"

Backend::Backend()
{

}

void Backend::logout()
{
    QDBusInterface iface("me.aren.OdysseusSession", "/ProcessManager", "", QDBusConnection::sessionBus());
    if (iface.isValid()) {
        QDBusMessage reply = iface.call("logout");
        if (reply.type() == QDBusMessage::ErrorMessage) {
            qDebug() << "Error:" << reply.errorMessage();
        }
    } else {
        qDebug() << "Interface is not valid";
    }
}
