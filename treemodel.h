#ifndef TREEMODEL_H
#define TREEMODEL_H

#include <QAbstractItemModel>
#include <QObject>
#include<QtSql>
#include<QSqlQuery>
#include<QDebug>

#include "itemslist.h"
class TreeModel : public QAbstractListModel
{
    Q_OBJECT

public:
    TreeModel(QSqlDatabase* db, QObject *parent = nullptr);

    enum RoleNames {
        LessonRole = Qt::UserRole + 1,
        TeacherRole
    };
    Q_ENUM(RoleNames)
    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    int columnCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    Qt::ItemFlags flags(const QModelIndex &index) const override;
    QHash<int, QByteArray> roleNames() const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const override;

signals:
    void tableSwapChoosed(int row, int column);
private:
    QSqlDatabase *m_db;
    QStringList m_headers;
    QList<ItemsList> m_data;    

    // QAbstractItemModel interface
public:
    bool setData(const QModelIndex &index, const QVariant &value, int role) override;
    QStringList headers() const;
};

#endif // TREEMODEL_H
