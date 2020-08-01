import QtQuick 2.12
import QtQuick.Controls 2.12

Label {
    id: control
    SIIcons {
        id: iconss
    }
    property alias icons: iconss
    property alias icon: control.text
    font.family: material_font.name
}
