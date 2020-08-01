import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import si.Core 1.0
import si.Controls 1.0
Page {
    property SIAppBar appBar: SIAppBar{
        id: siAppBar
        visible: false
        title: parent.title
    }
    property color backgroundColor: SIColors.iWhite
    Material.background: backgroundColor
    header: appBar
}
