#include "message.h"
#include <QDebug>

Message::Message(QObject *parent) :
  QObject(parent),
  m_counter(0),
  m_message("Startup message")
{
}

void Message::doMessageChange()
{
  setMessage("Hello Property World %1");
//  ++m_counter;
//  emit messageChanged(m_message.arg(m_counter));
}

void Message::setMessage(QString value) {
  m_message = value.arg(++m_counter);
  emit messageChanged();
}

int Message::sendMessageFromCpp(const QString value) {
  qDebug() << "This is C++ speaking. I heard QML say:" << value;
  return m_counter;
}
