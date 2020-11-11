import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import GlobalSettings 1.0
import LoginForm 1.0
import Cell 1.0
import GroupSchedule 1.0
import RegisterForm 1.0
import MainForm 1.0
import GridSchedule 1.0

ApplicationWindow {
    visible: true
    width: 1260
    height: 760
    color: '#222222'
    Material.theme: Material.Dark
    Material.accent: "White"

    StackView{
        id:stackView
        anchors.fill: parent
        initialItem: loginForm
        Component{
            id: mainForm
            MainForm{
                anchors.fill: parent
            }
        }

        Component{
            id: loginForm
            LoginForm{

                onLoginSucsess: {
                    if(stackView.depth > 1)
                        stackView.pop()
                    stackView.push(mainForm)
                }
                onRegister: {
                    stackView.push(register1)
                }
            }
        }
        Component{
            id: register1
            RegisterForm{

                onBack: {
                    stackView.pop()
                }

            }
        }
    }




}
