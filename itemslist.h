#ifndef ITEMSLIST_H
#define ITEMSLIST_H

#include <QObject>

struct Item
{
    QString lessonName;
    QString teacherName;
};

class ItemsList
{
public:
    ItemsList();
    ItemsList(int size);

    Item at(int idx) const;
    void append(const Item& item);
    void insert(int row, const Item& item);
    bool setDataAt(int row, const Item& item);
    bool isEmpty() const;
    int count() const;
private:
    QList<Item> m_data;
};

#endif // ITEMSLIST_H
