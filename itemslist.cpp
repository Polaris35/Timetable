#include "itemslist.h"
#include <QDebug>
ItemsList::ItemsList()
{

}

ItemsList::ItemsList(int size)
{
    m_data.reserve(size);
}

Item ItemsList::at(int idx) const
{
    return m_data[idx];
}

void ItemsList::append(const Item &item)
{
    m_data.append(item);
}

void ItemsList::insert(int row, const Item &item)
{
    m_data.insert(row, item);
}

bool ItemsList::setDataAt(int index, const Item &item)
{

    if(index < 0 || index >= m_data.size())
        return false;

    const Item &oldItem = m_data.at(index);

    if(item.lessonName == oldItem.lessonName && item.teacherName == oldItem.teacherName)
        return false;

    m_data[index] = item;
    return true;
}

bool ItemsList::isEmpty() const
{
    return count() == 0;
}

int ItemsList::count() const
{
    return m_data.count();
}
