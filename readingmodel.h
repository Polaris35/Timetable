//#ifndef READINGMODEL_H
//#define READINGMODEL_H
//#include<QAbstractListModel>
//#include<QtSql>
//#include<QSqlQuery>
//#include"itemslist.h"


//class ReadingModel: public QAbstractListModel
//{
//    Q_OBJECT
//public:
//    ReadingModel(QSqlDatabase* db);
//    enum RoleNames {
//        LessonRole = Qt::UserRole + 4,
//        TeacherRole
//    };
//    void append(const ItemsList&);
//    // QAbstractItemModel interface
//public:
//    int columnCount(const QModelIndex &parent) const override;
//    int rowCount(const QModelIndex &parent) const override;
//    QVariant data(const QModelIndex &index, int role) const override;
//    QHash<int, QByteArray> roleNames() const override;
//    bool insertRows(int row, int count, const QModelIndex &parent) override;

//private:
//    QList<ItemsList> m_data;
//    QSqlDatabase *m_db;
//};

//#endif // READINGMODEL_H
