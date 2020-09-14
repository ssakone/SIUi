import QtQuick 2.11
import QtQuick.Controls 2.4

import si.Core 1.0
import si.Dialog 1.0
import "qrc:/qrc/WQuery.js" as WQuery

ApplicationWindow {

    id: app

    property int closeCount: 1

    property bool enableAppMode: false

    property alias rootParent: app
    property alias font_awesome: font4
    property alias material_font: font3

    property string primaryColor: SIColors.iWhite
    property string secondaryColor: SIColors.iGray700
    property string primaryForegroundColor: SIColors.iBlack
    property string secondaryForegroundColor: SIColors.iGray50


    property var _: WQuery

    function siTr(string){
        return qsTr(string)
    }

    function showMessage(titre, message,policy={"ok":true},callback={},required=false){
        function checkCallback(vn){
            if(callback[vn] === undefined){
                return function(){}
            }else{
                return callback[vn]
            }
        }
        messageBox.title = titre
        messageBox.message = message
        messageBox.policy = policy
        messageBox.okCallback  =checkCallback("onOk")
        messageBox.noCallback = checkCallback("onNo") //callback["onNo"] === undefined ? function(){} :  callback["onNo"]
        messageBox.yesCallback = checkCallback("onYes") //callback["onYes"] === undefined ? function(){} :  callback["onYes"]
        messageBox.cancelCallback = checkCallback("onCancel") //callback["onCancel"] === undefined ? function(){} :  callback["onCancel"]
        messageBox.required = required
        messageBox.open()
    }
    function getMessageDialog(titre, message="Saisissez ici...",policy={"valider":true},callback={},required=false,password=false){
        function checkCallback(vn){
            if(callback[vn] === undefined){
                return function(){}
            }else{
                return callback[vn]
            }
        }
        textDialogBox.title = titre
        textDialogBox.place = message
        textDialogBox.policy = policy
        textDialogBox.password = password
        textDialogBox.validerCallback  = checkCallback("onValider")
        textDialogBox.required = required
        textDialogBox.open()
    }


    SIMessageBox {
        id: messageBox
        width: 350
        height: 200
    }
    SITextDialogBox {
        id: textDialogBox
        width: 350
        height: 200
    }

    FontLoader {
        id: font3
        source: "qrc:/qrc/Material.ttf"
    }

    FontLoader {
        id: font4
        property string family: "FontAwesome"
        source: "qrc:/qrc/fontawesome-webfont.ttf"
    }
    Timer {
        id: closeTimer
        interval: 400
        onTriggered: {
            closeCount = 1
            closeTimer.stop()
        }
    }

    onClosing: {
        if (closeCount === 1 && enableAppMode) {
            closeCount = 0
            close.accepted = false
            closeTimer.start()
        } else {
            close.accepted = true
        }
    }
}
