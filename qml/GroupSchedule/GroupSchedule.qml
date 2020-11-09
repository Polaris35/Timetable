import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import Cell 1.0



TableView {
    id: tableView
    flickableDirection: Flickable.AutoFlickIfNeeded
    columnSpacing: -2
    function columnWidthProvider(column) {
        return 100;
    }
    function rowHeightProvider(column) {
        return 60;
    }
    anchors.fill: parent
    leftMargin: rowsHeader.implicitWidth
    topMargin: columnsHeader.implicitHeight
    model: tableModel
    ScrollBar.horizontal: ScrollBar{}
    ScrollBar.vertical: ScrollBar{}
    clip: true
    delegate: Cell{
        implicitWidth: 200
        implicitHeight: 76
        teacher: model.teacher
        lesson: model.lesson
    }


    Row {
        id: columnsHeader
        y: tableView.contentY
        z: 2
        Repeater {
            model: tableView.columns > 0 ? tableView.columns : 1
            Label{
                //padding: 10
                height: 98
                width: 200
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Rectangle{
                    id:root
                    //property string group
                    width: 200
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
                                text: tableModel.headerData(0, Qt.Horizontal)
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: TextEdit.AlignHCenter
                                color: Material.accent
                            }
                        }
                        Rectangle{
                            id:main
                            width:200
                            height: 50
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
                                    Text {
                                        text: "Предмет"
                                        anchors.fill: parent
                                        color: Material.accent
                                        verticalAlignment: Text.AlignVCenter
                                        horizontalAlignment: TextEdit.AlignHCenter
                                    }
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

                    }
                }

            }
        }
    }
    Column {
        id: rowsHeader
        x: tableView.contentX
        z: 2
        Repeater {
            model: ["Понеділок", "Вівторок", "Середа", "Четверг", "Пятниця"]
            Label {
                width: 30
                height: 76 * 4
                Text {
                    text: model.data
                    rotation: 270
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                color: '#aaaaaa'
                font.pixelSize: 12
                background: Rectangle { color: "#333333" }
            }
        }
    }

    ScrollIndicator.horizontal: ScrollIndicator { }
    ScrollIndicator.vertical: ScrollIndicator { }
}
