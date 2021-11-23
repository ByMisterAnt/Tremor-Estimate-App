#include <QtPrintSupport/QPrinter>
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
//switch when build portable version
#include <QtStudio3D/qstudio3dglobal.h>
//#include <qstudio3dglobal.h>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "appengine.h"
#include "qmlplot.h"

int main(int argc, char *argv[])
{
    qputenv("QSG_INFO", "1");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QSurfaceFormat::setDefaultFormat(Q3DS::surfaceFormat());

    qmlRegisterType<CustomPlotItem>("CustomPlot", 1, 0, "CustomPlotItem");

    QQmlApplicationEngine engine;

    appEngine appCore;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("app", &appCore);

    engine.load(url);

    return app.exec();
}
