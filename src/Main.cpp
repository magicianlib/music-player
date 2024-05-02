#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[]) {

    // QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);
    // QGuiApplication::setHighDpiScaleFactorRoundingPolicy(Qt::HighDpiScaleFactorRoundingPolicy::PassThrough);

    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine{};

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("music-player", "App");

    return QGuiApplication::exec();
}
