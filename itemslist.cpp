#include "itemslist.h"

ItemsList::ItemsList()
{

}

Item ItemsList::at(int idx) const
{
    return m_data[idx];
}

void ItemsList::append(const Item &item)
{
    m_data.append(item);
}

int ItemsList::count() const
{
    return m_data.count();
}
