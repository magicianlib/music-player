#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "HttpClient.h"

int main(int argc, char* argv[]) {

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine{};

    qmlRegisterType<HttpClient>("cn.magician.HttpClient", 1, 0, "HttpClient");

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("music-player", "App");

    return QGuiApplication::exec();
}
