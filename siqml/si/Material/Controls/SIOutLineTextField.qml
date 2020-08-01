import QtQuick 2.12
import QtQuick.Controls 2.12

Item  {
    property alias horizontalAlignment: texto.horizontalAlignment
    property alias verticalAlignment: texto.verticalAlignment
    property alias font: texto.font
    property alias label: texto
    property alias validator: texto.validator
    property alias background: card
    SICard {
        id: card
        elevation: 2
        anchors.fill: parent
    }
    TextField {
        anchors.verticalCenter: parent.verticalCenter
        id: texto
        anchors.fill: parent
        bottomPadding: 10
        width: parent.width
        selectByMouse: true
        verticalAlignment: Text.AlignVCenter
        leftPadding: 10
        rightPadding: 10
        background: Item { }
    }
}
