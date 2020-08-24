import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
<<<<<<< HEAD
import "../Core/"
=======
import "../Core"
>>>>>>> d6a3561d9f61440ec7a0aea6f038b1f701687678
Page {
    id: control
    property SIAppBar appBar: SIAppBar{
        id: siAppBar
        visible: false
        title: control.title
    }
    property color backgroundColor: SIColors.iWhite
    Material.background: backgroundColor
    header: appBar
}
