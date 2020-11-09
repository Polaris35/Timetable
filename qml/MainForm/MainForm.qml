import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import GlobalSettings 1.0
import Cell 1.0
import GroupSchedule 1.0

Item{
    id: root
    anchors.fill: parent

    Rectangle{
        id:menu
        height: parent.height
        width: parent.width / 4
        border.color: Material.accent
        border.width: 1
        color: Material.background
        ColumnLayout{
            spacing: 10
//            anchors.horizontalCenter: menu.horizontalCenter
            anchors.topMargin: 10
            anchors.fill: parent
            Label{
                text: "Search Reading"
                Layout.alignment: Qt.AlignHCenter
                font.family: cullFont.name
                font.pixelSize: 40
            }

            TextField{
                id: login
                Layout.alignment: Qt.AlignHCenter
                placeholderText: "Lesson"
            }
            TextField{
                id: pass
                Layout.alignment: Qt.AlignHCenter
                placeholderText: "Teacher"
            }
            Button{
                text: "search"
                Layout.alignment: Qt.AlignHCenter
            }
            ListView{
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                clip: true
                model:readingModel
                                    flickableDirection: Flickable.AutoFlickIfNeeded
                                    ScrollBar.horizontal: ScrollBar{}
                                    ScrollBar.vertical: ScrollBar{}
                delegate: Cell {
                    lesson: model.lesson
                    teacher: model.teacher
                    Component.onCompleted: {
                        console.log("New delegate with = ", model.lesson, model.teacher)
                    }
                }

                                ScrollIndicator.horizontal: ScrollIndicator { }
                                ScrollIndicator.vertical: ScrollIndicator { }
            }
        }



    }
    Rectangle{
        height: parent.height
        width: parent.width - parent.width / 4
        anchors.left: menu.right
        //border.color: Material.accent
        //border.width: 1
        color: Material.background
        GroupSchedule{
            anchors.leftMargin: 30
            anchors.topMargin: 30
        }
    }

}
