import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import "../Core/"
TabButton {
    id: control
    property string iconString: ""
    text: ""
    height: 48*SIFonts.dpiDensity
    font: SIFonts.iCaption
    contentItem: Column {
        topPadding: 10
        width: parent.width
        height: parent.height
        SILabel {
          width: parent.width
          id: texto
          text: control.text
          font: control.font
          opacity: checked ? 1.0 : 0.4
          horizontalAlignment: Text.AlignHCenter
          elide: Text.ElideRight
          Material.foreground: Material.primaryColor
        }

    }
}
