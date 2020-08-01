import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

Control {
    property alias text: texto.text
    property alias label: texto
    property string identifier
    property bool showText: false
    property bool centerAlign: false
    property var head: parent.parent.parent.parent.parent.control.headers
    property int headIndex: 0
    Layout.fillHeight: true
    Layout.fillWidth: head.get(headIndex).fillWidth?? false
    width: head.get(headIndex).width ?? undefined
    clip: true
    padding: 0
    Label {
        visible: showText
        id: texto
        anchors.fill: parent
        text: index+1
        clip: true
        style: Text.Normal
        font.family: 'Arial'
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: head.get(headIndex).centerAlign? Text.AlignHCenter :  Text.AlignLeft
        leftPadding: 10
    }
}
