import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

import "../../Core/"
import "../"
import "qrc:/qrc/WQuery.js" as WQuery

Item {
    id: data_table_start
    property var model
    property alias delegate: list_view.delegate
    property bool navigation: false
    property string alternateBackgroundColor: SIColors.iGray200
    property string highlightColor: SIColors.iOrange300
    property bool hightlightTable: true
    property var searchModel
    property alias listView: list_view
    property bool alternateColor: false
    property bool search: false
    property bool dynamicData: false
    property alias background: body
    property bool hideHeader: false
    property bool expandList: false
    property var headers: []
    property alias headerBar: header

    height: colgg.height

    Rectangle {
        id: body
        y:50
        width: parent.width
        height: listView.height
        border.color: 'lightgrey'
        color: "transparent"
    }
    Column {
        id: colgg
        width: parent.width
        SIHeaderView {
            id: header
            width: parent.width
            height: 50
            visible: !hideHeader
            model: headers
        }

        clip: false
        SICard {
            width: parent.width
            height: listView.height
            elevation: 2
            clip: true
            SIList {
                property alias control: data_table_start
                id: list_view
                width: parent.width
                model: data_table_start.model
                clip: true
            }
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: 'lightgrey'
            }
        }
        SISpace { height: 10; width: 1 }
    }

}

