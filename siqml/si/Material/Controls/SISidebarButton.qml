import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import si.Core 1.0

import QtGraphicalEffects 1.0


Item {
    property string icon: "qrc:/Ressources/icons/icons8-achats-100.png"//aicon.fa_info_circle
    property string text: "Title"
    property string foregroundColor: "black"
    property string iconColor: foregroundColor
    property int iconSize: 26
    property alias label: textLabel
    property alias icons: iconLabel
    property string textColor: foregroundColor
    property bool showActive: true
    property bool iconFile: false
    property bool selected: false
    property int defaultHeight: 55
    signal clicked
    objectName: "item" + (Math.random(10) % 100).toString().replace(".", "")
    property string backgroundColor: "transparent"
    width: parent.width-10
    height: defaultHeight
    id: control
    property int leftPadding: 5
    Rectangle {
        id: bg
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: selected ? SIColors.iGray200 : area.containsMouse ? area.containsPress ? SIColors.iGray300 : SIColors.iGray500: SIColors.iGray300
        border.color: showActive === control.objectName ? SIColors.iGray300 : "transparent"
        border.width: 1
        radius: 5
        layer.enabled: true
        layer.effect: DropShadow {
            radius: showActive === control.objectName ? 0 : 3
            color: showActive === control.objectName ? 'transparent' : 'black'
        }

        RowLayout {
            anchors.fill: parent
            spacing: 10
            Item {
                width: 10
                height: 10

            }
            SIAIcon {
                id: iconLabel
                height: parent.height
                scale: selected? 1 : 0.8
                visible: !control.iconFile
                verticalAlignment: Label.AlignVCenter
                icon: control.icon
                color: selected? SIColors.iLightBlue700 : foregroundColor
                font.pixelSize: iconSize
            }
            Image {
                y: (parent.height/0)-(iconSize/2)
                scale: 0.8
                source: iconFile? control.icon : ""
                sourceSize.width: iconSize
                sourceSize.height: iconSize
                visible: iconFile
                fillMode: Image.PreserveAspectCrop

            }
            SILabel {
                id: textLabel
                height: parent.height
                verticalAlignment: Label.AlignVCenter
                color: area.containsPress || area.containsMouse? selected? SIColors.iGray500 : 'white': textColor
                text: control.text
                font: SIFonts.iButton

            }
            Item {
                Layout.fillWidth: true
                height: 10
            }
        }
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: "PointingHandCursor"
        onClicked: {
            control.parent.setCurrent(control)
        }
    }

    ToolTip {
        text: label.text
        visible: area.containsMouse
        delay: 500
    }
}
