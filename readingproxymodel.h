#ifndef READINGPROXYMODEL_H
#define READINGPROXYMODEL_H

#include <QSortFilterProxyModel>

class ReadingProxyModel : public QSortFilterProxyModel
{
    Q_OBJECT
signals:
    void lessonsSwapChoosed(int idx);
};

#endif // READINGPROXYMODEL_H
