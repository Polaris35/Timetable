import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
//import GlobalSettings 1.0

Rectangle{
    id: root
    width: 100
    height: 200
    color: Material.background
    RowLayout{
        Rectangle{
            color: Material.background
            width: 100
            ColumnLayout{
                spacing: -1
                anchors.fill: parent
                Rectangle{
                    width: parent.width
                    height: 56
                    color: Material.background
                    border.width: 1
                    border.color: Material.accent
                    Text {
                        text: qsTr("2020-2021\n I cместр")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: TextEdit.AlignHCenter
                        color: Material.accent
                    }
                }
                Rectangle{
                    color: Material.background
                    border.color: Material.accent
                    border.width: 1
                    width:root.width
                    height: 36
                    RowLayout{
                        anchors.fill: parent
                        Rectangle{
                            color: Material.background
                            border.color: Material.accent
                            border.width: 1
                            width: root.width - root.width / 5
                            height: root.height
//                            Text {
//                                text: qsTr("День")
//                                color: Material.accent
//                                verticalAlignment: Text.AlignVCenter
//                                horizontalAlignment: TextEdit.AlignHCenter
//                                //rotation: 270
//                                font.pixelSize: 12
//                                anchors.fill: parent
//                            }
                        }
                        Rectangle{
                            color: Material.background
                            border.color: Material.accent
                            border.width: 1
                            width: parent.width - parent.width / 8
                            height: parent.height
//                            Text {
//                                text: qsTr("Пара")
//                                color: Material.accent
//                                verticalAlignment: Text.AlignVCenter
//                                horizontalAlignment: TextEdit.AlignHCenter
//                                rotation: 270
//                                anchors.fill: parent
//                            }
                        }
                    }
                }
            }
        }

    }
}
