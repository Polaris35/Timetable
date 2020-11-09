#include "treemodel.h"

TreeModel::TreeModel(QSqlDatabase* db, QObject *parent) :
    QAbstractListModel(parent),m_db(db)
{
    QSqlQuery query(*m_db);
    QSqlQuery queryGroup(*m_db);
    if(!queryGroup.exec("SELECT * FROM Groups"))
    {
        qDebug() << queryGroup.lastQuery();
    }
    while(queryGroup.next())
    {
        ItemsList list;
        int id = queryGroup.value(0).toInt();
        m_headers << queryGroup.value(1).toString();
        query.prepare("SELECT Teacher.PIB, Discipline.name FROM Timetable "
                      "INNER JOIN Day ON Day.id = Timetable.id_day "
                      "INNER JOIN Pair ON Pair.id = Timetable.id_pair "
                      "INNER JOIN Reading ON Reading.id = Timetable.id_reading "
                      "INNER JOIN Teacher ON Teacher.id = Reading.id_teacher "
                      "INNER JOIN Discipline ON Discipline.id = Reading.id_discipline "
                      "INNER JOIN Groups ON Groups.id = Timetable.id_group "
                      "WHERE Groups.id = :group "
                      "ORDER BY id_day, id_pair ASC");
        query.bindValue(":group",id);
        if(!query.exec())
        {
            qDebug() << query.lastQuery();
        }
        while (query.next()) {
            Item item;
            item.teacherName = query.value(0).toString();
            item.lessonName = query.value(1).toString();
            list.append(item);
        }
        m_data.append(list);
        query.finish();

    }
}

int TreeModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_data.at(0).count();
}

int TreeModel::columnCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_data.count();
}

QVariant TreeModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    Item item = m_data[index.column()].at( index.row() );

    switch (role) {
    case LessonRole:
        return item.lessonName;

    case TeacherRole:
        return item.teacherName;
    }
    return QVariant();
}


Qt::ItemFlags TreeModel::flags(const QModelIndex &index) const
{
    if(!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable | Qt::ItemIsSelectable;
}

QHash<int, QByteArray> TreeModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[LessonRole] = "lesson";
    roles[TeacherRole] = "teacher";
    return roles;
}


QVariant TreeModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if(role != Qt::DisplayRole)
        return QVariant();

    if(orientation == Qt::Horizontal){
        switch(section){
        case 0:
            return  m_headers[section];
        default:
            return QVariant();
        }
    }
    else
    {
        switch (section) {
        case 0:
            return QString::number(section);
        default:
            return QVariant();
        }
    }

}
