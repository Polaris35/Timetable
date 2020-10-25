import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Cell 1.0


Rectangle{
    id:root
    //property string GroupName: groupName.text
    width: 200
    ScrollBar{
        active: true
    }

    //anchors.fill: parent
    //height: 200
    color: Material.background
    ColumnLayout {
        spacing: -1
        anchors.fill: parent
        Rectangle {
            width: 200
            height: 50
            color: Material.background
            border.color: Material.accent
            border.width: 1
            Text {
                anchors.fill:parent
                id: groupName
                text: model.GroupName
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: TextEdit.AlignHCenter
                color: Material.accent
            }
        }
        Rectangle{
            id:main
            width:200
            height: 76
            color: Material.background
            border.color: Material.accent
            border.width: 1
            RowLayout{
                spacing: -1
                Rectangle{
                    width: main.width - main.width / 5
                    height: main.height
                    color: Material.background
                    border.width: 1
                    border.color: Material.accent
                }
                Rectangle{
                    height: main.height
                    width: main.width / 5 + 1
                    border.color: Material.accent
                    border.width: 1
                    Text {
                        text: "Ауд."
                        anchors.fill: parent
                        color: Material.accent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: TextEdit.AlignHCenter
                        rotation: 270
                    }

                    color: Material.background
                }
            }
        }
    Rectangle{
        width: 200
        height:400
        ListView{
            anchors.fill: parent
            spacing: -1
            delegate: Cell {}
            model:list_el
        }
        color:Material.background
    }
    }







        ListModel{
            id:list_el

            ListElement{
                subject: "BD"
                teacher: "Yacubovskaya"
            }
            ListElement{
                subject: "OOP"
                teacher: "Kurop"
            }
            ListElement{
                subject: "discretka"
                teacher: "Kurop"
            }
            ListElement{
                subject: "KPZ"
                teacher: "Ermola"
            }
        }




}
