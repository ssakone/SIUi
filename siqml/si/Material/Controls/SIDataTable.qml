import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12

import "../Core/"
import "qrc:/qrc/WQuery.js" as WQuery

Item {
    id: data_table_start
    property var _: WQuery
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
    property int elementPerPage: 10
    property int currentPage: 1
    property int startCurrentPage: 0
    property int endCurrentPage: elementPerPage
    property bool pagination: true
    property bool dynamicData: false
    property alias searchModal: viewModel
    property alias header: header
    property alias background: body
    property list<Item> headerItems: [
        Item {}
    ]
    function getTotalPage(){
       var  i =  parseInt(searchModel.count/elementPerPage)
        if((searchModel.count%elementPerPage)!==0){
            console.log("cool")
            return i+1
        }
        return i
    }

    function next(){
        if(endCurrentPage<=searchModel.count){
            currentPage++
            startCurrentPage = elementPerPage+startCurrentPage
            endCurrentPage = endCurrentPage+elementPerPage
            viewModel.clear()
            for(var i=startCurrentPage;i<endCurrentPage;i++){
                  var d = searchModel.get(i)
                  _.assert(d===undefined) ? console.log("") :  viewModel.append(d)
            }
        }


    }
    function back(){
        if(startCurrentPage!=0){
            currentPage--
            startCurrentPage = startCurrentPage-elementPerPage
            endCurrentPage = endCurrentPage-elementPerPage
            viewModel.clear()
            for(var i=startCurrentPage;i<endCurrentPage;i++){
                  var d = searchModel.get(i)
                // @disable-check M127
                _.assert(d===undefined) ? console.log("") :  viewModel.append(d)
            }
        }
    }
    function searchData(data,target){
        searchModel.clear()
        _.forEachListModel(model,function(el){
            // @disable-check M23
            if(eval('el.'+target).toString().toUpperCase().indexOf(data.toUpperCase())!==-1){
              searchModel.append(el)
          }
        })
        search_refresh()
    }
    function searchDatas(data,targets){
        searchModel.clear()
        _.forEachListModel(model,function(el){
            var v = false
          for(var i=0;i<targets.length;i++){
              if(eval('el.'+targets[i]).toString().toUpperCase().indexOf(data.toUpperCase())!==-1){
                  v = true
              }
          }
          if(v){
              searchModel.append(el)
          }
        })
        search_refresh()
    }

    function search_refresh(){
        if(!dynamicData){
            viewModel.clear()
            if(pagination){
                for(var i=startCurrentPage;i<endCurrentPage;i++){
                     var d = searchModel.get(i)
                    _.assert(d===undefined) ? console.log("") :  viewModel.append(d)
                }
            }
        }
    }

    function refresh(){
        if(!dynamicData){
            searchModel.clear()
            viewModel.clear()
            _.forEachListModel(model,function(el){
               searchModel.append(el)
            })
            if(pagination){
                for(var i=startCurrentPage;i<endCurrentPage;i++){
                      var d = searchModel.get(i)
                    _.assert(d===undefined) ? console.log("") :  viewModel.append(d)
                }
            }
        }
    }

    ListModel {
        id: searchModel
    }
    ListModel {
        id: viewModel
    }
    height: colgg.height
    onModelChanged: {
        refresh()
    }
    Rectangle {
        id: body
        y:50
        width: parent.width
        height: listView.contentHeight
        border.color: 'lightgrey'
        color: "transparent"
    }
    MouseArea {
        anchors.fill: parent
        onClicked:  {
            list_view.focus = true
        }
    }
    Column {
        id: colgg
        width: parent.width
        height: pagination ? listView.contentHeight+110 : listView.contentHeight+110
        Item {
            width: parent.width
            height: 40
            visible: search
            RowLayout {
                anchors.fill: parent
                Item {Layout.fillWidth: true}
                Label {
                    text: "Recherche : "
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                }
                TextField {
                    font.pixelSize: 16
                    implicitWidth: 200
                    font.family: 'Arial'
                    leftPadding: 5
                    topPadding: 10
                    placeholderText: "Votre recherche..."
                }
            }
        }    
        Rectangle {
            id: header
            width: parent.width
            height: 50
            border.color: 'lightgrey'
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                color: 'lightgrey'
                height: 4
            }
            RowLayout {
                id: header_items
                anchors.fill: parent
                children: headerItems
            }
        }
        clip: false
        SICard {
            width: parent.width
            height: parent.height-header.height-60
            elevation: 2


            ListView {
                property alias control: data_table_start
                id: list_view
                flickableDirection: Flickable.AutoFlickIfNeeded
                flickDeceleration: 2
                keyNavigationEnabled: navigation
                width: parent.width
                height: parent.height
                model: {
                    if(dynamicData) {
                        data_table_start.model
                    }else {
                        if(pagination){
                            viewModel
                        }else {
                            data_table_start.model
                        }
                    }
                }

                clip: true
                contentHeight: height
            }
            Rectangle {
                anchors.fill: parent
                color: "transparent"
                border.color: 'lightgrey'
            }
        }

        SISpace{ height: 10;width: 1 }
        Item {
            width: parent.width
            height: 50
            visible: pagination
            Row{
                rightPadding: 10
                height: 50
                anchors.right: parent.right
                spacing: 10
                SIButton {
                    text: "Précédent"
                    flat: true
                    width: 100
                    height: 50
                    onClicked: back()
                }
                Label {
                    text: "("+currentPage+" - "+getTotalPage()+")"
                    height: 50
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 15
                }
                SIButton {
                    text: "Suivant"
                    flat: true
                    width: 100
                    height: 50
                    onClicked: next()
                }
            }
        }
    }

}

