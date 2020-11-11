import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.1

Item{
    id: root
    signal back()
    anchors.fill: parent
    ColumnLayout{
        spacing: 40
        anchors.centerIn: parent
        Label{
            text: "Registration Form"
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
        TextField{
            id: pass_confirm
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Confirm password"
        }
        Button{
            text: "submit"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {

                if(login.text == ""){
                    login.placeholderTextColor = Material.color(Material.Red);
                    return;
                }

                if(pass.text == ""){
                    pass.placeholderTextColor = Material.color(Material.Red);
                    return;
                }
                if(pass_confirm.text == ""){
                    pass_confirm.placeholderTextColor = Material.color(Material.Red);
                    return;
                }
                if(pass.text != pass_confirm.text)
                {
                    pass_confirm.placeholderTextColor = Material.color(Material.Red);
                    pass.placeholderTextColor = Material.color(Material.Red);
                    users.registerFailure()
                    return;
                }
                users.registration(login.text, pass.text);
            }
            Connections {
                target: users
                onRegisterSuccess:{
                    back()
                }
                onRegisterFailure:{
                    login.placeholderTextColor = Material.color(Material.Red);
                    pass.placeholderTextColor = Material.color(Material.Red);
                }
            }
        }
        Button{
            text: "back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                back()
            }
        }

    }
}
