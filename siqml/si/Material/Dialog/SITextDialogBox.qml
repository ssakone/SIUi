import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import si.Core 1.0
import si.Controls 1.0

Popup {

    signal okClicked()
    signal cancelClicked()
    signal yesClicked()
    signal noClicked()
    signal validerClicked()

    property var policy: {"nothing":""}
    property string title
    property string message
    property string place: ""

    property bool required: false
    property bool password: false

    property var okCallback: function(){}
    property var noCallback: function(){}
    property var yesCallback: function(){}
    property var cancelCallback: function(){}
    property var validerCallback: function(){}

    x: (rootParent.width/2)-width/2
    y: (rootParent.height/2)-height/2
    dim: true
    modal: required
    padding: 0
    id:romi
    closePolicy: required ? Popup.NoAutoClose : Popup.CloseOnPressOutside

    onOkClicked: {
        close()
        okCallback()
    }
    onNoClicked: {
        noCallback(romi)
    }
    onYesClicked: {
        close()
        yesCallback(ven.label.text,romi)
    }
    onCancelClicked: {
        cancelCallback()
    }
    onValiderClicked: {
        validerCallback(ven.label.text,romi)
    }

    Rectangle {
        width: parent.width
        height: 60
        color: Qt.darker(secondaryColor)
    }
    ColumnLayout {
        width: parent.width-10
        height: parent.height-10
        anchors.centerIn: parent
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "transparent"
            Label {
                x: 10
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                text: title
                font.pixelSize: 18
                font.weight: Font.Thin
                color: secondaryForegroundColor
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
            SIOutLineTextField {
                id: ven
                anchors.centerIn: parent
                width: parent.width-10
                height: 50
                label.focus: true
                label.echoMode: password? TextField.Password : TextField.Normal
                label.placeholderText: place
                Keys.onReturnPressed: {
                    validerClicked()
                }
            }
        }

        Item {
            Layout.fillWidth: true
            height: 50
            Row {
                height: 50
                anchors.right: parent.right
                spacing: 10
                SIButton {
                    height: parent.height
                    label.text: siTr("Oui")
                    backgroundColor: Qt.darker(secondaryColor)
                    foregroundColor: secondaryForegroundColor
                    visible: policy["yes"] === undefined? false:  policy["yes"]
                    onClicked: yesClicked()
                }
                SIButton {
                    height: parent.height
                    text: siTr("Ok")
                    backgroundColor: Qt.darker(secondaryColor)
                    foregroundColor: secondaryForegroundColor
                    visible: policy["ok"] === undefined? false:  policy["ok"]
                    onClicked: okClicked()
                }
                SIButton {
                    height: parent.height
                    text: siTr("Valider")
                    backgroundColor: Qt.darker(secondaryColor)
                    foregroundColor: secondaryForegroundColor
                    visible: policy["valider"] === undefined? false:  policy["valider"]
                    onClicked: validerClicked()
                }
                SIButton {
                    height: parent.height
                    text: siTr("Non")
                    backgroundColor: SIColors.iOrange700
                    foregroundColor: SIColors.iWhite
                    visible: policy["no"] === undefined? false:  policy["no"]
                    onClicked: noClicked()
                }
                SIButton {
                    height: parent.height
                    text: siTr("Annuler")
                    backgroundColor: SIColors.iDeepOrange700
                    foregroundColor: SIColors.iWhite
                    visible: policy["cancel"] === undefined? false:  policy["cancel"]
                    onClicked: cancelClicked()
                }
            }
        }
    }
    onOpened: {
        ven.label.focus = true
        ven.label.forceActiveFocus()
        ven.label.text = ""
    }
    Component.onCompleted: ven.label.forceActiveFocus()
}
