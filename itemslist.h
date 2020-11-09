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
    Item at(int idx) const;
    void append(const Item& item);
    int count() const;
private:
QList<Item> m_data;
};

#endif // ITEMSLIST_H
