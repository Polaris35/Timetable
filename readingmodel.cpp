//#include "readingmodel.h"

//ReadingModel::ReadingModel(QSqlDatabase* db)
//    :m_db(db)
//{
//    QSqlQuery query(*m_db);
//    ItemsList list;
//    query.prepare("SELECT Teacher.PIB, Discipline.name FROM Reading "
//                  "INNER JOIN Teacher ON Teacher.id = Reading.id_teacher "
//                  "INNER JOIN Discipline ON Discipline.id = Reading.id_discipline "
//                  );

//    if(!query.exec())
//    {
//        qDebug() << query.lastQuery();
//    }
//    while (query.next()) {
//        Item item;
//        item.teacherName = query.value(0).toString();
//        item.lessonName = query.value(1).toString();
//        list.append(item);

//    }
//    this->append(list);
//    query.finish();
//}

//void ReadingModel::append(const ItemsList & list)
//{
//    qDebug() << Q_FUNC_INFO;
//    if(insertRows(m_data.length(),1,{}))
//            qDebug() << "Appending at " << this->rowCount({});

//        if(this->rowCount({}) == 0)
//        {
//            qDebug() << "fuck! model is empty!";
//        }
//        m_data[m_data.length()-1] = list;
//        //emit dataChanged();
//}


//int ReadingModel::rowCount(const QModelIndex &parent) const
//{
//    if(parent.isValid())
//        return 0;

//    return m_data.at(0).count();
//}

//int ReadingModel::columnCount(const QModelIndex &parent) const
//{
//    if(parent.isValid())
//        return 0;

//    return m_data.count();
//}

//QVariant ReadingModel::data(const QModelIndex &index, int role) const
//{
//    if(!index.isValid())
//        return QVariant();

//    Item item = m_data[index.column()].at( index.row() );

//    switch (role) {
//    case LessonRole:
//        qDebug() << 1;
//        return item.lessonName;
//    case TeacherRole:
//        qDebug() << 1;
//        return item.teacherName;
//    default:
//        return QVariant();
//    }
//}

//QHash<int, QByteArray> ReadingModel::roleNames() const
//{
//    QHash<int, QByteArray> roles;
//    roles[LessonRole] = "lesson";
//    roles[TeacherRole] = "teacher";
//    return roles;
//}


//bool ReadingModel::insertRows(int row, int count, const QModelIndex &parent)
//{

//    qDebug() << Q_FUNC_INFO << row << count;
//    beginInsertRows(QModelIndex(),row,row+count-1);
//    qDebug() << Q_FUNC_INFO;
//    for(int i = 0;i<count;++i)
//    {
//        qDebug() << Q_FUNC_INFO << i << row;
//        m_data.insert(row,{});
//        qDebug() << Q_FUNC_INFO << i << row;
//    }
//    endInsertRows();
//    qDebug() << Q_FUNC_INFO;
//    return true;
//}
