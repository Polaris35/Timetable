#include "users.h"

Users::Users(QSqlDatabase * db)
    :m_db(db)
{

}

void Users::registration(QString login, QString pass)
{
    QSqlQuery query(*m_db);
    query.prepare("INSERT INTO Users (login, passwor) VALUES "
                  "(:login,:pass)");
    query.bindValue(":login", login);
    query.bindValue(":password", pass);
    emit registerSuccess();

}

void Users::login(QString login, QString pass)
{
    QSqlQuery query(*m_db);
    query.prepare("SELECT EXISTS(SELECT login, password FROM"
                  " Users WHERE login = :login AND"
                  " password = :password)");
    query.bindValue(":login", login);
    query.bindValue(":password", pass);
    if(!query.exec())
        qDebug() << query.lastError().text();
    if(query.next())
        emit authSuccsess();
    else
        emit authFailure();
}
