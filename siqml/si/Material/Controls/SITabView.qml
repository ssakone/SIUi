import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.11
Item {
    id: control
    property alias pageStacks: stackPage.children
    property alias tabButtons: tab.contentChildren
    property color tabBackgroundColor: Material.color(Material.Blue)
    property int tabElevation: 1
    property alias tabBar: tab
    property alias stackView: stackPage
    property bool centerAlign: false
    Column{
        anchors.fill: parent
        TabBar{
            Material.accent: Material.primaryColor
            Material.background: tabBackgroundColor
            id:tab
            anchors.horizontalCenter: parent.horizontalCenter
            width: control.centerAlign? children.width : parent.width
            height: 50
            z:99
            contentWidth: 2000
            bottomPadding: 0
            Material.elevation: tabElevation
        }
        StackLayout{
            id:stackPage
            currentIndex: tab.currentIndex
            width: parent.width
            height: parent.height-50

        }
    }
}
