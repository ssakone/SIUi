import QtQuick 2.12

import "../Core/"

import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import QtQuick.Window 2.13

Popup {
    property var types: {
        "success":[()=>{lotieSuccess=true;lotieError=false;lotieWarning=false;currentLotie=lotie1;lotieInfo=false}],
        "warning":[()=>{lotieSuccess=false;lotieError=false;lotieWarning=true;currentLotie=lotie2;lotieInfo=false}],
        "error":[()=>{lotieSuccess=false;lotieError=true;lotieWarning=false;currentLotie=lotie3;lotieInfo=false}],
        "info":[()=>{lotieSuccess=false;lotieError=false;lotieWarning=false;currentLotie=lotie3;lotieInfo=true}]
    }
    property int duration: 0
    property string title: ""
    property string description: ""
    property bool lotieSuccess: false
    property bool lotieWarning: false
    property bool lotieError: false
    property bool lotieInfo: false
    property var currentLotie: lotie1
    property bool iconView: false
    property bool showCancelButton: false
    property string confirmButtonColor: SIColors.iBlue600
    property string cancelButtonColor: SIColors.iRed600
    property string confirmButtonText: "OK"
    property string cancelButtonText: "Cancel"
    property var confirm

    function alert(data){
        if(data['icon']){
            iconView = true
            try{types[data['icon']][0]()}catch(e){}
        }
        showCancelButton= data['showCancelButton']??false
        confirmButtonColor= data['confirmButtonColor'] ??SIColors.iBlue600
        cancelButtonColor= data['cancelButtonColor']?? SIColors.iRed600
        confirmButtonText= data['confirmButtonText']?? "OK"
        cancelButtonText= data['cancelButtonText']?? "Cancel"
        confirm = data['confirm']?? function(){}
        title= data['title']?? ""

        description = data['description']?? ""
        popup.open()
    }
    function fire(title="",description="",icon=undefined,confirm){
        if(icon===undefined){
            iconView = false
        }else{
            iconView = true
        }
        popup.title = title
        popup.description = description
        popup.confirm = confirm?? function(){}
        showCancelButton= false
        confirmButtonColor= SIColors.iBlue600
        confirmButtonText=  "OK"
        try{types[icon][0]()}catch(e){}
        popup.open()
    }
    id: popup
    width: 400
    height: iconView===true? label1.implicitHeight+label2.implicitHeight+(col.spacing*5)+15+70+120 : label1.implicitHeight+label2.implicitHeight+(col.spacing*5)+15+50
    topPadding: 0
    bottomPadding: 0
    anchors.centerIn: Overlay.overlay
    modal:true
    background: Rectangle {
        radius: 7
    }
    onOpened: {
        currentLotie.playing = true
    }
    Column {
        id:col
        topPadding: 15
        bottomPadding: 15
        width: parent.width
        anchors.verticalCenter: parent.verticalCenter
        AnimatedImage {
            opacity: popup.opacity-.4
            id: lotie1
            source: "qrc:/qrc/check.gif"
            width: 100
            height: 100
            visible: lotieSuccess
            playing: false
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentFrameChanged: {
                if(currentFrame===frameCount-1){
                    playing = false
                }
            }
        }
        AnimatedImage {
            opacity: popup.opacity-.4
            id: lotie2
            width: 100
            height: 100
            visible: lotieWarning
            source: "qrc:/qrc/warning.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentFrameChanged: {
                if(currentFrame===frameCount-1){
                    playing = false
                }
            }
        }
        AnimatedImage {
            opacity: popup.opacity-.4
            id: lotie3
            width: 100
            height: 100
            visible: lotieError
            source: "qrc:/qrc/danger.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentFrameChanged: {
                if(currentFrame===frameCount-1){
                    playing = false
                }
            }
        }
        AnimatedImage {
            opacity: popup.opacity-.4
            id: lotie4
            width: 100
            height: 100
            visible: lotieInfo
            source: "qrc:/qrc/info.gif"
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentFrameChanged: {
                if(currentFrame===frameCount-1){
                    //playing = false
                }
            }
        }
        Item{width: 1;height: 5}
        spacing: 10
        Label {
            id: label1
            text: popup.title
            font.family: 'Arial'
            font.weight: Font.Bold
            font.pixelSize: 28
            color: SIColors.iGray700
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Label.AlignHCenter
        }
        Label {
            id: label2
            text:  popup.description
            font.family: 'Arial'
            font.weight: Font.Normal
            font.pixelSize: 18
            color: SIColors.iGray700
            width: parent.width
            wrapMode: Label.Wrap
            horizontalAlignment: Label.AlignHCenter
        }
        Item{width: 1;height: 5}
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            height: 40
            spacing: 7
            SIButton {
                //extendWidth: 50
                height: 45
                text: popup.confirmButtonText
                foregroundColor: SIColors.iWhite
                Material.primary: popup.confirmButtonColor
                font.pixelSize: 18
                onClicked: {
                    if(!showCancelButton){
                        popup.close()
                    }
                    popup.confirm(popup)
                }
            }
            SIButton {
                visible: showCancelButton
                //extendWidth: 20
                height: 45
                text: popup.cancelButtonText
                foregroundColor: SIColors.iWhite
                Material.primary: popup.cancelButtonColor
                font.pixelSize: 18
                onClicked: popup.close()
            }
        }
    }

    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; }
        NumberAnimation { property: "width"; from: popup.width/2; to: popup.width; easing.type: Easing.OutBack; duration: 500 }
        NumberAnimation { property: "height"; from: popup.height/2; to: popup.height; easing.type: Easing.OutBack; duration: 500 }
    }


}
