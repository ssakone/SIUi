import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import Qt.labs.settings 1.1
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material.impl 2.12


Drawer {
    property var items: []
    property int radius: 30
    property var target
    property var elevation: 2
    property alias load: loader
    z: 99999
    padding: 5
    id: bottomSheet
    background: Item{}
    edge: Qt.BottomEdge
    width: loader.item.width

    position: Qt.BottomEdge
    height: loader.item.height
    function push(item){
        items.push(item)
        loader.sourceComponent = item
        bottomSheet.open()
    }
    function pop(){
        if(items!=[]){
            items.pop()
            var i = items[items.length-1]
            loader.sourceComponent = i
        }
    }

    Behavior on y{
        NumberAnimation{
            duration: 350
            easing.type: Easing.InBack
        }
    }

    
    Rectangle {
        width: loader.item.width-20
        x: 10
        radius: bottomSheet.radius
        height: loader.item.height+radius
        anchors.horizontalCenter: parent.horizontalCenter
        layer.enabled: true
        layer.effect: ElevationEffect {
            elevation: bottomSheet.elevation
        }
        Loader {
            id: loader
            sourceComponent: bottomSheet.target
        }
    }
    Component.onCompleted: {bottomSheet.open();bottomSheet.close()}
//    Component {
//        id: sheet1
//        Item  {
//            width: myPage.width
//            height: 200
//            Text {
//                anchors.centerIn: parent
//                text: "Hello My Bottom Sheet 1"
//            }
//            Button {
//                anchors.bottom: parent.bottom
//                anchors.horizontalCenter: parent.horizontalCenter
//                text: "Avant"
//                onClicked: bottomSheet.push(sheet2)
//            }
//        }
//    }
//    Component {
//        id: sheet2
//        Item  {
//            width: myPage.width
//            height: 150
//            Text {
//                anchors.centerIn: parent
//                text: "Hello My Bottom Sheet"
//            }
//            Button {
//                anchors.bottom: parent.bottom
//                anchors.horizontalCenter: parent.horizontalCenter
//                text: "Arriere"
//                onClicked: bottomSheet.pop()
//            }
//        }
//    }

//    SIBottomSheet {
//        id: bottomSheet
//        radius: 30
//        elevation: 1
//    }
}
