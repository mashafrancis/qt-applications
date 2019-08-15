#ifndef STARTUP_H
#define STARTUP_H

#pragma once
#include <QObject>

class QQmlApplicationEngine;
class MainViewMgr;

class Startup : public QObject
{
  Q_OBJECT
public:
  explicit Startup(QObject *parent = nullptr);

signals:

public slots:

private:
  QQmlApplicationEngine& m_engine;
  MainViewMgr& m_mainViewMgr;

  explicit Startup(const Startup& rhs) = delete;
  Startup& operator = (const Startup& rhs) = delete;
};

#endif // STARTUP_H
