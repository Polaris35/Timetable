#include "timetable.h"
#include "readingmodel.h"
#include "treemodel.h"

#include <QSqlDatabase>

TimeTable::TimeTable(QObject *parent)
    : QObject(parent)
    , m_readingModel{nullptr}
    , m_treeModel{nullptr}
    , m_toSwap{ QPair{-1,-1} }
    , m_fromSwap{-1}
    , m_db{nullptr}
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
    qDebug() << Q_FUNC_INFO << "Creating query";
    QSqlQuery query(*m_db);
    query.prepare(
                "UPDATE Timetable "
                  "SET id_reading = (SELECT R.id "
                                              "FROM Reading R "
                                                       "INNER JOIN Teacher T ON R.id_teacher = T.id "
                                                       "INNER JOIN Discipline D ON R.id_discipline = D.id "
                                              "WHERE ( "
                                                            "T.PIB = :teacher "
                                                            "AND "
                                                            "D.name = :lesson "
                                                        ") "
                  "LIMIT 1) "
                  "WHERE id IN( "
                                "SELECT id "
                                "FROM Timetable "
                                         "INNER JOIN Pair P ON Timetable.id_pair = P.id "
                                         "INNER JOIN Groups G ON Timetable.id_group = G.id "
                                         "INNER JOIN Day D2 ON Timetable.id_day = D2.id "
                                "WHERE ( "
                                              "G.name = :groupName "
                                              "AND "
                                              "D2.name = :day "
                                              "AND "
                                              "P.serial_number = :pairIdx "
                                          "))");
qDebug() << Q_FUNC_INFO << "Binding values";
QStringList days {"Понеділок", "Вівторок", "Середа", "Четверг", "Пятниця"};
int pairIdx = toX;
int dayIdx = 0;
while(pairIdx > 3){
    pairIdx -= 4;
    ++dayIdx;
}

    query.bindValue(":teacher", item.teacherName);
    query.bindValue(":lesson", item.lessonName);
    query.bindValue(":pairIdx", pairIdx + 4);
    query.bindValue(":groupName", m_treeModel->headers().at(toY));
    query.bindValue(":day", days.at(dayIdx));

    qDebug() << Q_FUNC_INFO << "Executing...";
    if(!query.exec()) {
        qDebug() << Q_FUNC_INFO << query.lastError().text();
    }
    query.finish();

}

void TimeTable::setDb(QSqlDatabase *db)
{
    m_db = db;
}









