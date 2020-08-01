import QtQuick 2.14
import QtQuick.Layouts 1.12
import "../"

Rectangle {
    property var model
    id: header
    border.color: 'lightgrey'
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        color: 'lightgrey'
        height: 4
    }
    RowLayout {
        anchors.fill: parent
        Repeater {
            model: header.model
            delegate: SITableHeaderItem {
                height: parent.height
                Layout.fillWidth: try{header.model.get(index).fillWidth?? false}catch(e){false}
                Layout.preferredWidth: try{header.model.get(index).width ?? 0}catch(e){0}
                text: try{header.model.get(index).name}catch(e){""}
            }
        }
    }
}