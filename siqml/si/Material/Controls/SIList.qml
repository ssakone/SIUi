import QtQuick 2.11
import QtQuick.Controls 2.14

Page {
    property alias delegate: rep.delegate
    property alias model: rep.model
    property alias listView: column
    property int space: 0
    height: listView.height
    Column {
        id: column
        width: parent.width
        spacing: space
        clip: true
        Repeater {
            id: rep
        }
    }
}
