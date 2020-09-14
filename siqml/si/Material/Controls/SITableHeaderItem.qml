import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

Item {
    property bool fillWidth: false
    property alias text: texto.text
    property alias label: texto
    property bool centerAlign: false
    width: fillWidth? Layout.fillWidth= true: 100
    Layout.fillHeight: true
    RowLayout {
        anchors.fill: parent
        Label {
            id: texto
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "#"
            font.pixelSize: 16
            font.family: 'Arial'
            font.weight: Font.Medium
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: centerAlign? Text.AlignHCenter : Text.AlignLeft
            leftPadding: 10
        }

    }
}
