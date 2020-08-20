import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import "../Core/"

Pane {
    property string title: ""
    property int elevation: 1
    property int titleSize: 20
    property int barHeight: 56
    property bool dense: false
    property alias leading: lead
    property alias leftItem: leftBar
    property bool prominent: false
    property bool barImaged: false
    property int titleSpaceWidth: 10
    property bool centerTitle: false
    property bool hideOnScroll: false
    property int prominentHeight: 200
    property alias barImage: backgroundImage
    property alias titleLabel: prominenttext
    property alias titleLabel2: titleBarLabel
    property bool scrollProminentView: false
    property alias headerLayout: toolBarLayout
    property bool scrollEnableElevation: false
    property int defaultHeight: dense ? 70 : 56
    property color accentColor: SIColors.iGray900
    property color foregroundColor: SIColors.iWhite
    property color backgroundColor: SIColors.iBlue500
    property int prominentImplicitHeight: prominentHeight
    property bool transparentBackground: false
    property list<Item> actions: [

        Item {
            Layout.fillWidth: true
            height: 1
            visible: !titleBarLabel.visible
        }

    ]
    height: prominent ? prominentHeight : defaultHeight
    width: control.parent.width
    Material.accent: accentColor
    Material.foreground: foregroundColor
    Material.elevation: elevation
    Material.background: backgroundColor
    id: control


    Image {
        id: backgroundImage
        visible: barImaged
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height-0.2
    }
    padding: 0
    background: Rectangle {
        layer.enabled: control.backgroundColor === "transparent"? false : true
        color: control.backgroundColor
        layer.effect: ElevationEffect {
            elevation: control.elevation
        }
    }
    Behavior on height {
        NumberAnimation {
            duration: 100
        }
    }
    SIRow {
        anchors.fill: parent
        SIRowItem {
            id: leftBar
            lg: 9
            xs: 9
            md: 9
            sm: 9
            xl: 9
            height: parent.height
            children: Row {

                SIAppBarButton {
                    id: lead
                    z:888
                    icons: {
                        var nav = false;
                        if(nav){SIIcons.iArrow_back}else{SIIcons.iMenu}
                    }

                    color: foregroundColor
                }

                Label {
                    height: parent.height
                    id: titleBarLabel
                    text: title
                    visible: !prominent
                    width: (parent.width-100 )-lead.width
                    font: SIFonts.iHEAD6
                    horizontalAlignment: centerTitle ? Text.AlignHCenter : Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }
                spacing: titleSpaceWidth
                anchors.margins: 4
                width: parent.width
                height: parent.height-10

                anchors {
                    verticalCenter: prominent ?  undefined : parent.verticalCenter
                    top: prominent ? parent.top : undefined
                    topMargin: prominent ? 15 : 0
                }

            }

        }
        SIRowItem {
            lg: 3
            xs: 3
            md: 3
            sm: 3
            xl: 3
            height: parent.height
            Row {
                id: toolBarLayout
                height: parent.height-10
                anchors {
                    verticalCenter: prominent ?  undefined : parent.verticalCenter
                    top: prominent ? parent.top : undefined
                    topMargin: prominent ? 15 : 0
                    right: parent.right
                }
                children: actions
                spacing: 5
            }
        }
    }

    Label {
        id: prominenttext
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 14
        anchors.left: parent.left
        anchors.leftMargin: 70
        width: parent.width/2
        wrapMode: Label.Wrap
        text: title
        font.pointSize: 20
        visible: prominent
    }
}
