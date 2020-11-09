import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12


Rectangle{
    id: main
    implicitHeight: 76
    implicitWidth: 200
    property string teacher
    property string lesson
    //anchors.centerIn: parent

    color: Material.backgroundColor
    border.width: 1
    border.color: Material.accent

    RowLayout{
        spacing: -1
        anchors.fill: parent
        Rectangle {
            width: main.width - main.width / 5
            height: main.height
            color: Material.backgroundColor
            border.width: 1
            border.color: Material.accent
            Layout.fillWidth: true
            Layout.fillHeight: true
            Text {
                id: subject
                width: main.width - main.width / 5
                text: lesson
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
                text: teacher
                font.pixelSize: 9
                anchors.top: subject.bottom
                color: Material.accent
                anchors.topMargin: 10
                smooth: true
                width: main.width - main.width / 5
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: TextEdit.AlignHCenter
                wrapMode: Text.WordWrap
            }
        }
        ColumnLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: -1
            Rectangle
            {
                id:box_au1
                border.color: Material.accent
                border.width: 1
                Text {
                    text: " "
                    //anchors.fill: parent
                    color: Material.accent
                    anchors.centerIn: parent
                }
                height: main.height / 2 + 1
                width: main.width / 5 + 1
                color: Material.backgroundColor
            }
            Rectangle
            {
                id:box_au2
                border.color: Material.accent
                border.width: 1
                Text {
                    text: " "
                    //anchors.fill: parent
                    color: Material.accent
                    anchors.centerIn: parent
                }
                height: main.height / 2
                width: main.width / 5 + 1
                color: Material.backgroundColor

            }
        }
    }
}
