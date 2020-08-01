import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtGraphicalEffects 1.0


import "../Core/"

MouseArea {
    id: control
    property int radius: 5
    property int space:  5
    property alias iconSource: cicon.source
    property alias text: texto.text
    property alias label: texto
    property alias font: texto.font
    property string highlightColor: Qt.lighter(backgroundColor)
    property string backgroundColor: SIColors.iWhite
    property string foregroundColor: SIColors.iBlack
    property int extendWidth: 0
    property int elevation: 5
    cursorShape: "PointingHandCursor"
    hoverEnabled: true
    width: cicon.implicitWidth+texto.implicitWidth+10+extendWidth
    Rectangle {
        id: back
        radius: control.radius
        anchors.fill: parent
        color:  control.containsMouse? Qt.lighter(backgroundColor) : backgroundColor
        layer.enabled: control.enabled
        layer.effect:  DropShadow{
            radius: control.elevation
            color: 'gray'

        }
    }
    InnerShadow{
       anchors.fill: back
       source: back
       color: Qt.darker(backgroundColor)
       radius: 100
       samples: 30
       visible: control.containsPress
       //verticalOffset: 3
   }
    Row {
        anchors.centerIn: parent
        SIAIcon {
            property string source: ""
            id:  cicon
            icon: source
            font.pixelSize: control.font.pixelSize
            color: foregroundColor
            verticalAlignment: Label.AlignVCenter
        }
        spacing: control.space
        Label {
            id: texto
            text: control.text
            font: control.font
            color: foregroundColor
            verticalAlignment: Label.AlignVCenter
        }
    }

}
