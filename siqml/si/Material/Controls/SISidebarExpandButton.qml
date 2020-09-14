import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12

Item {
    property string icon: aicon.fa_info_circle
    property string text: "Title"
    property string iconColor: "white"
    property string textColor: "white"
    property bool showActive: true
    property int iconSize: 26
    property alias label: textLabel
    property alias icons: iconLabel
    property int defaultHeight: 60
    property bool enableAnimation: true
    property alias areas: area
    property int level: 1
    property list<Item> childs: [
        Item {}
    ]
    signal clicked
    property string backgroundColor: drawer.backgroundColor
    Layout.fillWidth: true
    height: defaultHeight
    id: control
    property int leftPadding: 5
    clip: true
    Rectangle {
        id: bg
        width: parent.width
        height: defaultHeight
        color: area.containsMouse ? area.containsPress ? Qt.darker(
                                                             Qt.darker(
                                                                 backgroundColor)) : Qt.darker(
                                                             backgroundColor) : backgroundColor
        RowLayout {
            anchors.fill: parent
            spacing: 10
            Item {
                width: level!==1 ? leftPadding+(level*10) : 0
                height: 10
            }

            Text {
                id: iconLabel
                anchors.verticalCenter: parent.verticalCenter
                font.family: font_awesome.family
                text: control.icon
                color: iconColor
                font.pixelSize: iconSize
            }
            Label {
                id: textLabel
                anchors.verticalCenter: parent.verticalCenter
                color: drawer.isOpen() ? textColor : "transparent"
                font.pixelSize: 16
                font.family: 'Arial'
                text: control.text
            }
            Item {
                Layout.fillWidth: true
                height: 10
            }
        }
        Label {
            x: subButtons.visible ? parent.width - 25 : parent.width - 20
            anchors.verticalCenter: parent.verticalCenter
            text: subButtons.visible ? aicon.fa_caret_up : aicon.fa_caret_right
            color: iconColor
            font.pixelSize: 22
        }

        MouseArea {
            objectName: "test"
            id: area
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: "PointingHandCursor"
            onClicked: {
                if (subButtons.visible) {
                    control.implicitHeight = defaultHeight
                    subButtons.visible = false
                } else {
                    control.implicitHeight = defaultHeight + subButtons.height
                    control.height = subButtons.height
                    subButtons.visible = true
                    if (level == 2) {
                        control.parent.controler.areas.clicked(mouse)
                        control.parent.controler.areas.clicked(mouse)
                    }
                    if (level == 3) {
                        control.parent.controler.areas.clicked(mouse)
                        control.parent.controler.areas.clicked(mouse)
                    }
                }
            }
        }
    }
    Item {
        id: subButtons
        y: defaultHeight
        width: parent.width
        height: colg.height
        clip: true
        visible: false
        Behavior on height {
            NumberAnimation {
                duration: enableAnimation ? 250 : 0
            }
        }

        ColumnLayout {
            property alias controler: control
            //x: 20
            id: colg
            spacing: 0
            width: parent.width //- 20
            children: childs
        }
    }
}
