import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

Item {
    id: drawer
    property string backgroundColor: colors.iGray200
    property list<Item> items: [
        Item {}
    ]
    property bool navigationView: true
    property var openWidth: 200
    property int closeWidth: 65
    property string currentSelected: ""
    property bool enableAnimation: true
    function isOpen() {
        if (drawer.width == openWidth) {
            return true
        } else {
            return false
        }
    }

    function open() {
        drawer.implicitWidth = openWidth
    }
    function popup() {
        implicitWidth = openWidth
    }
    function close() {
        implicitWidth = closeWidth
    }
    Behavior on implicitWidth {
        NumberAnimation {
            duration: enableAnimation ? 200 : 0
            running: enableAnimation
        }
    }
    width: closeWidth
    implicitWidth: closeWidth

    Pane {
        anchors.fill: parent

        Material.elevation: 5
        z: 2
        padding: 0
        Rectangle {
            anchors.fill: parent
            color: backgroundColor
        }
        Column {
            spacing: 10
            anchors.fill: parent
            children: items
            property alias drawerItem: drawer
        }
    }
}
