import QtQuick 2.11
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import si.Core 1.0

RoundButton{
    id: control

    property color iconColor: 'white'
    property string icons: SIIcons.iMenu
    property color backgroundColor: SIColors.iTeal200
    property string foregroundColor: SIColors.iTeal200
    property int iconSize: 18
    property int elevation: 6
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    anchors.rightMargin: 10
    anchors.bottomMargin: 15
    width: 80
    height: 80
    Material.elevation: elevation
    Material.foreground: foregroundColor
    Material.background: backgroundColor
    SIIcon{
        icon: icons
        font.pointSize: iconSize
        color: iconColor
        anchors.centerIn: parent

    }
    background: Rectangle {
        color: control.backgroundColor
        radius: control.height/2

        Ripple {
            implicitWidth: control.Material.touchTarget
            implicitHeight: control.Material.touchTarget

            readonly property bool square: control.contentItem.width <= control.contentItem.height

            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            clip: !square
            width: square ? parent.height-20  : parent.width
            height: square ? parent.height-20 : parent.height
            pressed: control.pressed
            anchor: control
            active: control.enabled && (control.down || control.visualFocus || control.hovered)
            color: control.Material.rippleColor
        }
        layer.enabled: control.enabled
        layer.effect: ElevationEffect {
            elevation: control.elevation
        }
    }
}
