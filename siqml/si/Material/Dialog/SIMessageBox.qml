import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import si.Controls 1.0
import si.Core 1.0

Popup {

    signal okClicked()
    signal cancelClicked()
    signal yesClicked()
    signal noClicked()

    property var policy: {"nothing":""}
    property string title
    property string message

    property bool required: false

    property var okCallback: function(){}
    property var noCallback: function(){}
    property var yesCallback: function(){}
    property var cancelCallback: function(){}

    x: (rootParent.width/2)-width/2
    y: (rootParent.height/2)-height/2
    dim: true
    padding: 0
    closePolicy: required ? Popup.NoAutoClose : Popup.CloseOnPressOutside

    onOkClicked: {
        close()
        okCallback()
    }
    onNoClicked: {
        close()
        noCallback()
    }
    onYesClicked: {
        close()
        yesCallback()
    }
    onCancelClicked: {
        close()
        cancelCallback()
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
            Label {
                anchors.centerIn: parent
                width: parent.width
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                text: message
                font.pixelSize: 16
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

}
