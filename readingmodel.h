#ifndef READINGMODEL_H
#define READINGMODEL_H
#include<QAbstractListModel>
#include<QtSql>
#include<QSqlQuery>
#include"itemslist.h"


class ReadingModel : public QAbstractListModel
{
    Q_OBJECT
public:
    ReadingModel(QSqlDatabase* db);
    enum RoleNames {
        LessonRole = Qt::UserRole + 4,
        TeacherRole
    };
    // QAbstractItemModel interface

    void append(const Item &rhs);
public:
    int rowCount(const QModelIndex &parent) const override;

    QVariant data(const QModelIndex &index, int role) const override;

    QHash<int, QByteArray> roleNames() const override;

    bool insertRows(int row, int count, const QModelIndex &parent) override;

    bool setData(const QModelIndex &index, const QVariant &value, int role) override;

signals:
    void lessonsSwapChoosed(int idx);
private:
    ItemsList m_data;
    QSqlDatabase *m_db;

};

#endif // READINGMODEL_H
