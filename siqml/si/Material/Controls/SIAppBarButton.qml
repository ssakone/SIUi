import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Material.impl 2.12
import "../Core/"
ToolButton{
    id:control
    property string icons:""
    property alias color: texto.color
    font.pointSize: 24
    implicitHeight: 90
    anchors.verticalCenter: parent.verticalCenter
    Text {
        id:texto
        text:icons
        anchors.centerIn: parent
        font.pointSize: control.font.pointSize
        font.family: SIFonts.materialIcon
    }
}


