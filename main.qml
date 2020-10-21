import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import GlobalSettings 1.0
import LoginForm 1.0


ApplicationWindow{
    visible: true
    width: 480
    height: 640
    FontLoader { id: cullFont; source: "qrc:/fonts/ConcertOne-Regular.ttf" }
    Material.theme: Material.Dark
    Material.accent: "White"


}

