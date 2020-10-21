import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Item {
    id:root
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
            onClicked: {
                if(login.text == "")
                    login.placeholderTextColor = Material.color(Material.Red);
                if(pass.text == "")
                    pass.placeholderTextColor = Material.color(Material.Red);
            }
        }
    }
}
