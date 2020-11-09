#include "timetable.h"
#include "readingmodel.h"
#include "treemodel.h"

TimeTable::TimeTable(QObject *parent)
    : QObject(parent)
    , m_readingModel(nullptr)
    , m_treeModel(nullptr)
    , m_toSwap{ QPair{-1,-1} }
    , m_fromSwap{-1}
{

}

void TimeTable::setReadingModel(ReadingModel *readingModel)
{
    if(m_readingModel)
        m_readingModel->disconnect(this);

    m_readingModel = readingModel;
    connect(m_readingModel, &ReadingModel::lessonsSwapChoosed, this, &TimeTable::lessonsSwapChoosed);
}

void TimeTable::setTreeModel(TreeModel *treeModel)
{
    if(m_treeModel)
        m_treeModel->disconnect(this);

    m_treeModel = treeModel;
    connect(m_treeModel, &TreeModel::tableSwapChoosed, this, &TimeTable::tableSwapChoosed);
}

void TimeTable::lessonsSwapChoosed(int idx)
{
    m_fromSwap = idx;
    if(m_toSwap.first != -1 && m_toSwap.second != -1) {
        qDebug() << Q_FUNC_INFO;
        swapValues();
    }
}

void TimeTable::tableSwapChoosed(int row, int col)
{
    m_toSwap.first = row;
    m_toSwap.second = col;

    if(m_fromSwap != -1) {
        qDebug() << Q_FUNC_INFO;
        swapValues();
    }
}

void TimeTable::swapValues()
{
    int toX = m_toSwap.first;
    int toY = m_toSwap.second;
    int from = m_fromSwap;

    m_fromSwap = -1;
    m_toSwap = QPair{-1,-1};
    qDebug() << Q_FUNC_INFO << "swapping that stuff";
    Item item;
    item.lessonName = m_readingModel->data(m_readingModel->index(from),ReadingModel::RoleNames::LessonRole).toString();
    item.teacherName = m_readingModel->data(m_readingModel->index(from),ReadingModel::RoleNames::TeacherRole).toString();

    m_treeModel->setData(m_treeModel->index(toX,toY), item.lessonName, TreeModel::RoleNames::LessonRole);
    m_treeModel->setData(m_treeModel->index(toX,toY), item.teacherName, TreeModel::RoleNames::TeacherRole);
}









