import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
//import GlobalSettings 1.0

ColumnLayout{
    spacing: -1
    Rectangle{
        color: Material.background
        border.color: Material.accent
        width: 100
        height: 50
        border.width: 1
        Text {
            text: qsTr("2020-2021\nI семестр")
            anchors.centerIn: parent
            color: Material.accent
        }
    }
    Rectangle{
        width: 100
        height: 60
        color: Material.background
        border.color: Material.accent
        border.width: 1
        RowLayout{
            anchors.fill: parent
            spacing: -1
            Rectangle{
                id: cell_day
                border.color: Material.accent
                border.width: 1
                color: Material.background
                height: parent.height
                width: parent.width / 5
                Text {
                    text: qsTr("День")
                    rotation: 270
                    anchors.centerIn: parent
                    color: Material.accent
                }
            }
            Rectangle{
                border.color: Material.accent
                border.width: 1
                color: Material.background
                height: parent.height
                width: parent.width / 5
                Text {
                    text: qsTr("Пара")
                    rotation: 270
                    anchors.centerIn: parent
                    color: Material.accent
                }
            }
//            Rectangle{
//                border.color: Material.accent
//                border.width: 1
//                color: Material.background
//                height: parent.height
//                width: parent.width - (parent.width / 2)
//                Text {
//                    text: qsTr("Пара")
//                    rotation: 270
//                    anchors.centerIn: parent
//                    color: Material.accent
//                }
//            }
        }
    }
}
