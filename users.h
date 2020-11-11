#ifndef USERS_H
#define USERS_H

#include <QObject>
#include<QSqlDatabase>
#include<QtSql>
#include<QSqlQuery>
#include<QString>

class Users:public QObject
{
    Q_OBJECT
public:
    Users(QSqlDatabase *);
    Q_INVOKABLE void registration(QString login,QString pass);
    Q_INVOKABLE void login(QString login,QString pass);
signals:
    void registerSuccess();
    void registerFailure();

    void authSuccsess();
    void authFailure();
private:
    QSqlDatabase *m_db;

};

#endif // USERS_H
