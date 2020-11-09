#ifndef TIMETABLE_H
#define TIMETABLE_H

#include <QObject>

class ReadingModel;
class TreeModel;
class TimeTable : public QObject
{
    Q_OBJECT
public:
    explicit TimeTable(QObject *parent = nullptr);

    void setReadingModel(ReadingModel *readingModel);

    void setTreeModel(TreeModel *treeModel);

private slots:
    void lessonsSwapChoosed(int idx);
    void tableSwapChoosed(int row, int col);

    void swapValues();

signals:

private:
    ReadingModel *m_readingModel;
    TreeModel *m_treeModel;

    QPair<int,int> m_toSwap;
    int m_fromSwap;
};

#endif // TIMETABLE_H
