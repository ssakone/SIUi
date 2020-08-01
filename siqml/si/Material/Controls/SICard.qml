import QtQuick 2.11
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtGraphicalEffects 1.0
Item {
    id:  control
    property int elevation: 1
    property int radius: 5
    property alias background: body
    property color elevationColor: 'gray'
    clip: false
    Rectangle {
        id: body
        anchors.fill: parent
        radius: parent.radius
        layer.enabled: control.enabled
        layer.effect:  DropShadow{
            radius: control.elevation
            color: elevationColor
        }
    }
}
