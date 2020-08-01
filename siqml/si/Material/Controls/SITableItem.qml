import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

Control {
    property alias text: texto.text
    property alias label: texto
    property string identifier
    property bool showText: true
    property bool centerAlign: false
    Layout.fillHeight: true
    width: eval(identifier).fillWidth ?  Layout.fillWidth= true : eval(identifier).width
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
        horizontalAlignment: centerAlign? Text.AlignHCenter : Text.AlignLeft
        leftPadding: 10
    }
}
