#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFontDatabase>
#include <QDir>
#include <QFile>
#include <QQmlContext>
#include <QtSql/QSqlDatabase>
#include <QSqlQuery>
#include<QSortFilterProxyModel>
#include "treemodel.h"
#include "readingmodel.h"
#include "timetable.h"
#include "readingproxymodel.h"
#include "users.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QFontDatabase fontDB;

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    QDir path;
    db.setDatabaseName("C:\\sqlite\\Schedule.db");

    if (!db.open())
        qDebug() << db.lastError().text();

//    qmlRegisterType<TreeModel>("TreeModel",1,0,"TreeModel");
    fontDB.addApplicationFont("qrc:/qml/fonts/ConcertOne-Regular.ttf");
    app.setFont(QFont(QStringLiteral("ConcertOne-Regular")));
    QQuickStyle::setStyle("Material");

    TreeModel model(&db);
    ReadingModel readingModel(&db);

    ReadingProxyModel readingProxyModel;
    Users user(&db);

    readingProxyModel.setSourceModel(&readingModel);
    readingProxyModel.setFilterRole(ReadingModel::LessonRole);


    TimeTable timeTable;
    timeTable.setReadingModel(&readingModel);
    timeTable.setTreeModel(&model);
    timeTable.setDb(&db);

    QObject::connect(&readingProxyModel,&ReadingProxyModel::lessonsSwapChoosed,&timeTable,&TimeTable::lessonsSwapChoosed);

    QQmlApplicationEngine engine;
    engine.addImportPath(":/qml");
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    engine.rootContext()->setContextProperty("tableModel", &model);
    engine.rootContext()->setContextProperty("readingModel", &readingProxyModel);
    engine.rootContext()->setContextProperty("timeTable", &timeTable);
    engine.rootContext()->setContextProperty("users", &user);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);
    return app.exec();
}
