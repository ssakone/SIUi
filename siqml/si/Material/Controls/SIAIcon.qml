import QtQuick 2.12
import QtQuick.Controls 2.12

Label {
    id: control
    property alias icon: control.text
    FontLoader {
        id: font_awesome
        property string family: "FontAwesome"
        source: "qrc:/qrc/fontawesome-webfont.ttf"
    }
    font.family: font_awesome.family
}
