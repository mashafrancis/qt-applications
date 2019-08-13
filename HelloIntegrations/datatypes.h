#ifndef DATATYPES_H
#define DATATYPES_H

#pragma once
#include <QObject>
#include <QString>

class DataTypes : public QObject {
  Q_OBJECT
public:
  explicit DataTypes(QObject *parent=nullptr);
  void logVariantList(QObject* root);
  void logVariantMap(QObject* root);

private:
  explicit DataTypes(const DataTypes& rhs) = delete;
  DataTypes& operator = (const DataTypes& rhs) = delete;
};

#endif // DATATYPES_H
