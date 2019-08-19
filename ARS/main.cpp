#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <startup.h>

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  Startup my_startup;
  return app.exec();
}
