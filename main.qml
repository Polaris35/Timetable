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
    FontLoader { id: cullFont; source: "qrc:/fonts/ConcertOne-Regular.ttf" }
    width: 1640
    height: 880
    color: '#222222'
    Material.theme: Material.Dark
    Material.accent: "White"
    //    MainForm{
    //        anchors.fill: parent
    //    }

    GroupSchedule{
        id: grid

    }




}
