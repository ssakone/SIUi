import QtQuick 2.12
import QtQuick.Controls 2.12
import "../Core/"

Item  {
    id: field
    property alias horizontalAlignment: texto.horizontalAlignment
    property alias verticalAlignment: texto.verticalAlignment
    property alias font: texto.font
    property alias label: texto
    property alias validator: texto.validator
    property alias background: card
    property var completionModel: []
    property string completionText: ""
    property bool completion: false
    property string accept: "text"
    property double spinTop: 99999999.0
    property double spinBottom: 0.0
    property alias completionHightlightColor: view.hightColor
    property bool selectOnPress: false
    property bool required: false
    function isValid(){
        background.background.border.width = 2
        if(required){
            if(texto.text===""){
                background.background.border.color = SIColor.iRed600
                return false
            }else {
                background.background.border.color = SIColor.iLightGreen500
                return true
            }
        }else {
            background.background.border.color = SIColor.iLightGreen500
            return true
        }
    }
    function reset(i=""){
        texto.text = i
        background.background.border.width = 1
        background.background.border.color = SIColor.iGray400
    }

    Keys.onDownPressed: {
        if(field.completion)
            view.incrementCurrentIndex()
    }
    Keys.onUpPressed: {
        if(field.completion)
            view.decrementCurrentIndex()
    }
    Keys.onReturnPressed: {
        if(field.completion) {
            var text = view.model.get(view.currentIndex).name
            label.text = text
            completionText = text
            pop.close()
        }
    }
    SICard {
        id: card
        elevation: 2
        anchors.fill: parent
    }
    IntValidator {
        id: intValidator
        top: parseInt(field.spinTop)
        bottom: parseInt(field.spinBottom)
    }
    DoubleValidator {
        id: doubleValidator
        top: field.spinTop
        bottom: field.spinBottom
    }

    TextField {
        anchors.verticalCenter: parent.verticalCenter
        id: texto
        anchors.fill: parent
        bottomPadding: 10
        width: parent.width
        selectByMouse: true
        verticalAlignment: Text.AlignVCenter
        leftPadding: 10
        rightPadding: 10
        validator: field.accept==="text"? undefined : field.accept==="int"? intValidator : field.accept==="double"? doubleValidator : undefined
        background: Item { }
        onFocusChanged: {
            if(focus!==true){
                deselect()
            }
        }

        MouseArea {
            anchors.fill: parent
            visible: !texto.focus
            cursorShape: "IBeamCursor"
            onClicked: {
                texto.focus = true
                texto.forceActiveFocus()
                field.selectOnPress?  texto.selectAll() : undefined
            }
        }
    }
    Popup {
        id: pop
        transformOrigin: Item.Top
        y: field.height-5
        height: view.height
        width: field.width
        padding: 0

        Connections {
            target: field.label
            function onTextChanged(s){
                if(field.completion){
                    var text = field.label.text
                    view.model.clear()
                    if(text!==""){
                        for(var i=0; i<field.completionModel.length;i++){
                            var er = field.completionModel[i]
                            if(er.toUpperCase().indexOf(text.toUpperCase())!==-1){
                                view.model.append({name: er})
                            }
                        }
                        if(view.model.count!==0){
                            pop.open()
                        }
                    }
                }


            }
        }
        ListView {
            property color hightColor: SIColors.iTeal600
            id: view
            width: parent.width
            height: 200
            model: ListModel{}
            spacing: 1
            clip: true
            delegate: SILabel {
                padding: 10
                width: view .width
                text: name
                wrapMode: Label.Wrap
                color: view.currentIndex===index? SIColors.iWhite : SIColors.iBlack
                background: Rectangle {
                    color:  view.currentIndex===index? area.containsMouse? Qt.darker(view.hightColor ) : view.hightColor : area.containsMouse? SIColors.iGray200 : SIColors.iWhite
                }
                MouseArea {
                    id: area
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        var text = view.model.get(index).name
                        label.text = text
                        completionText = text
                        pop.close()
                    }
                }
            }
        }
    }
}
