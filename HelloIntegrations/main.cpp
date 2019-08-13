#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "message.h"
#include "datatypes.h"
#include <QDebug>

void TestInvoke(QObject* rootObject){
  QVariant return_value;
  QVariant msg = "This is C++ parameter";
  QMetaObject::invokeMethod(rootObject,
                            "javaScriptFunction",
                            Q_RETURN_ARG(QVariant, return_value),
                            Q_ARG(QVariant, msg));
  qDebug() << "QML returned " << return_value;
}

int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;
  Message my_msg;
  auto root_context = engine.rootContext();
  root_context->setContextProperty("messageClass", &my_msg);

  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  auto root_object = engine.rootObjects().first();

  DataTypes my_dts;
  my_dts.logVariantList(root_object);
  my_dts.logVariantMap(root_object);

//  TestInvoke(root_object);

  return app.exec();
}
