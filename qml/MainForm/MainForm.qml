import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2
import GlobalSettings 1.0
import Cell 1.0
import GroupSchedule 1.0

Item{
    id: root
    anchors.fill: parent
    Dialog {
        id: teacherErrorDialog
        visible: false
        standardButtons: StandardButton.Ok
        title: "Помилка"
        contentItem: Rectangle {
            color: Material.backgroundColor
            implicitWidth: 400
            implicitHeight: 100
            Label {
                anchors.centerIn: parent
                text: "Неможливо поставити пару - викладач зайнятий!"
            }
        }
        onAccepted: {
            teacherErrorDialog.visible = false
        }



        Connections {
            Component.onCompleted: console.log("dialog Created!")
            target: tableModel
            onErrorTeacherBusy: {
                console.log("Dialog is opened")
                teacherErrorDialog.visible = true
            }
        }
    }

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
                id: lesson
                Layout.alignment: Qt.AlignHCenter
                placeholderText: "Lesson"
            }            
            Button{
                text: "search"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    readingModel.setFilterFixedString(lesson.text)
                }
            }
            ListView{
                id: readingView
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                clip: true
                model:readingModel
                flickableDirection: Flickable.AutoFlickIfNeeded
                ScrollBar.horizontal: ScrollBar{}
                ScrollBar.vertical: ScrollBar{}
                highlightFollowsCurrentItem: false
                highlight: delegateHighlight
                spacing: 5
                Component
                {
                    id: delegateHighlight
                    Rectangle
                    {
                        id: highlightImpl
                        width: 200
                        height: 75
                        color: "transparent"
                        y: readingView.currentItem.y
                        border.width: 5
                        border.color: Material.color(Material.DeepOrange)
                        z: 4
                        Behavior on y
                        {
                            PropertyAnimation
                            {
                                //easing.type: Easing.bezierCurve
                                duration: 250
                            }
                        }
                    }
                }
                delegate: Cell {
                    lesson: model.lesson
                    teacher: model.teacher
                    z: 3
                    MouseArea {
                        id: cellArea
                        anchors.fill: parent
                        z: 5
                        onClicked: {
                            readingView.currentIndex = index
                            readingModel.lessonsSwapChoosed(model.row)
                            console.log("Choosed ", model.row, " in readings")

                        }
                    }
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
