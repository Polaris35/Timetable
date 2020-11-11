#ifndef TIMETABLE_H
#define TIMETABLE_H

#include <QObject>

class QSqlDatabase;
class ReadingModel;
class TreeModel;
class TimeTable : public QObject
{
    Q_OBJECT
public:
    explicit TimeTable(QObject *parent = nullptr);

    void setReadingModel(ReadingModel *readingModel);

    void setTreeModel(TreeModel *treeModel);

    void setDb(QSqlDatabase *db);

private slots:

    void tableSwapChoosed(int row, int col);

    void swapValues();
public slots:
    void lessonsSwapChoosed(int idx);

private:
    ReadingModel *m_readingModel;
    TreeModel *m_treeModel;

    QPair<int,int> m_toSwap;
    int m_fromSwap;

    QSqlDatabase *m_db;
};

#endif // TIMETABLE_H
