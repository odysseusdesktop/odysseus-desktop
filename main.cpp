#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include "backend.h"
#include "desktopview.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Backend>("Backend", 1, 0, "Backend");

    QList<DesktopView*> desktopViews;
    for (int i = 0; i < app.screens().length(); i++) {
        desktopViews.append(new DesktopView(nullptr, app.screens()[i]));
    }

    for (int i = 0; i < desktopViews.length(); i++) {
        desktopViews[i]->show();
    }


    return app.exec();
}

#include "main.moc"
