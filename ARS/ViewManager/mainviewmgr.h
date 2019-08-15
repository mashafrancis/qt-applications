#ifndef MAINVIEWMGR_H
#define MAINVIEWMGR_H

#pragma once
#include <QObject>
#include <QString>
#include "PropertyHelper.h"

class MainViewMgr : public QObject
{
        Q_OBJECT
        READONLY_PROPERTY(QString, appName)
        Q_PROPERTY(QString appNameVer READ appNameVer CONSTANT)
        AUTO_PROPERTY(bool, powerOn)
        Q_SIGNAL
        public:
            explicit MainViewMgr(QObject *parent=0);
        //QString appName() const {return m_appName;}
        QString appNameVer() const {return appName()+" "+APP_VER;}

    private:
        //QString m_appName;
        explicit MainViewMgr(const MainViewMgr& rhs) = delete;
        MainViewMgr& operator= (const MainViewMgr& rhs) = delete;
    private slots:
        void debugPowerOn(bool value);

};



#endif // MAINVIEWMGR_H
