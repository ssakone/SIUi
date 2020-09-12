import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15
import QtGraphicalEffects 1.0
import "../Core/"

MouseArea {
    id: control
    property bool flat: false
    property bool texted: false
    property int elevation: 2
    property bool highlighted: false
    property color accentColor: texted? Qt.lighter(Material.primaryColor) : flat? Qt.lighter(Material.primaryColor) : Qt.lighter(bbackground.color)
    readonly property int realElevation: containsMouse? elevation+8 : elevation
    property color foregroundColor: texted? Material.primaryColor : flat? accentColor : SIColors.iWhite
    property string icon: ""
    property alias text: label.text
    property alias font: label.font
    property int radius: 3
    enabled: true
    width: brow.implicitWidth+30
    height: brow.implicitHeight+20
    cursorShape: "PointingHandCursor"
    clip: false
    layer.enabled: control.enabled
    layer.effect: DropShadow {
        verticalOffset: 1
        radius: control.realElevation
        color: SIColors.iGray400
    }
    Rectangle {
        id: bbackground
        anchors.fill: parent
        radius: parent.radius
        color: control.texted? 'transparent' : control.flat? 'transparent' : Material.primaryColor
        border.color: control.texted? 'transparent' : control.flat? SIColors.iGray400 : color
        Rectangle {
            implicitWidth: parent.width
            implicitHeight: parent.height
            opacity: control.flat || control.texted? .4 : 1

            radius: 3
            color: !control.enabled ? Qt.darker(bbackground.color) :
                    control.highlighted ? Qt.lighter(bbackground.color) : control.Material.buttonColor

            Ripple {
                clipRadius: 3
                width: parent.width
                height: parent.height
                pressed: control.pressed
                anchor: control
                color: control.flat && control.highlighted ? control.Material.highlightedRippleColor : control.accentColor
            }
        }
    }
    Row {
        id: brow
        spacing: 5
        anchors.centerIn: parent
        SIIcon {
            id: iconLabel
            icon: control.icon
            color: control.foregroundColor
            font.pixelSize: label.font.pixelSize+5
            anchors.verticalCenter: parent.verticalCenter
        }

        Label {
            id: label
            anchors.verticalCenter: parent.verticalCenter
            text: ""
            font: SIFonts.iButton
            color: control.foregroundColor
            antialiasing: true
            smooth: true
            style: Label.Normal
            renderType: Label.NativeRendering
        }
    }
}
