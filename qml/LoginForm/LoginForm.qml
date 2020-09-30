import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

ApplicationWindow {
    id:root
    visible: true
    width: 480
    height: 640
    FontLoader { id: cullFont; source: "qrc:/fonts/ConcertOne-Regular.ttf" }
    Material.theme: Material.Dark
    Material.accent: Material.Cyan

    ColumnLayout{
        spacing: 40
        anchors.centerIn: parent
        Label{
            text: "Login Form"
            Layout.alignment: Qt.AlignHCenter
            font.family: cullFont.name
            font.pixelSize: 40
        }
        TextField{
            id: login
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Login"
        }
        TextField{
            id: pass
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Password"

        }
        Button{

            text: "submit"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
