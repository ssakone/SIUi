import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

import "../Core/"

Button {
    id: control
    property int space:  10
    property alias iconSource: cicon
    property alias label: texto
    property string backgroundColor: SIColors.iWhite
    property string foregroundColor: SIColors.iBlack
    Row {
        anchors.centerIn: parent
        SIAIcon {
            property string source: ""
            id:  cicon
            icon: source
            font.pixelSize: control.font.pixelSize
            color: foregroundColor
            anchors.verticalCenter: parent.verticalCenter
        }
        spacing: parent.space
        Label {
            id: texto
            text: control.text
            font: control.font
            color: foregroundColor
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    contentItem: Item{}
    Material.background: backgroundColor
}
