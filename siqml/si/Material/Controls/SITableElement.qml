import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import QtGraphicalEffects 1.0

import "../Core/"
Rectangle {
    property string borderColor: SIColors.iGray200
    property list<Item> items: [
        Item {}
    ]
    property alias mouse: arene
    color: 'transparent'
    opacity: mouse.containsMouse? 0.8 : 0.8
    MouseArea {
        id: arene
        anchors.fill: parent
        hoverEnabled: true
    }
    RowLayout {
        id: row
        objectName: "row"
        anchors.fill: parent
        children: parent.items
    }
}
