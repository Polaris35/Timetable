import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import RegisterForm 1.0
Item {
    id:root
    signal loginSucsess()
    signal register()
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
                {
                    login.placeholderTextColor = Material.color(Material.Red);
                    return;
                }
                if(pass.text == ""){
                    pass.placeholderTextColor = Material.color(Material.Red);
                    return;
                }
                users.login(login.text,pass.text)
            }
            Connections {
                target: users
                onAuthSuccsess:{
                    loginSucsess()
                }
                onAuthFailure:{
                    login.placeholderTextColor = Material.color(Material.Red);
                    pass.placeholderTextColor = Material.color(Material.Red);
                }
            }
        }
        Button{
            text: "Registration"
            Layout.alignment: Qt.AlignHCenter
            onClicked: {
                   register()
            }
        }
    }


}

