import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12


Rectangle{
    id: main
    width:200
    height:76

    anchors.centerIn: parent

    color: Material.backgroundColor
    border.width: 0
    border.color: Material.accent

    RowLayout{
        spacing: -1

        Rectangle{
            width: main.width - main.width / 5
            height: main.height
            color: Material.backgroundColor
            border.width: 1
            border.color: Material.accent

            Text {
                id: subject
                width: main.width - main.width / 5
                text: model.subject
                font.pixelSize: 11
                color: Material.accent
                smooth: true
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: TextEdit.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.top: parent.top
                anchors.topMargin: 5
            }
            Text {
                text: model.teacher
                font.pixelSize: 9
                anchors.top: subject.bottom
                color: Material.accent
                anchors.topMargin: 10
                width: main.width - main.width / 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: TextEdit.AlignHCenter
                wrapMode: Text.WordWrap
            }
        }
        ColumnLayout{
            spacing: 0
            Rectangle
            {
                id:box_au1
                border.color: Material.accent
                border.width: 1
                Text {
                    text: model.first_au
                    //anchors.fill: parent
                    color: Material.accent
                    anchors.centerIn: parent
                }
                height: main.height / 2
                width: main.width / 5
                color: Material.backgroundColor
            }
            Rectangle
            {
                id:box_au2
                border.color: Material.accent
                border.width: 1
                Text {
                    text: model.second_au
                    //anchors.fill: parent
                    color: Material.accent
                    anchors.centerIn: parent
                }
                height: main.height / 2
                width: main.width / 5
                color: Material.backgroundColor

            }
        }
    }
}
