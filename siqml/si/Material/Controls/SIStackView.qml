import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.3

StackView {
    id:stack
    property bool enableAnimation: true

//    pushEnter: Transition {
//      id: pushEnter
//      ParallelAnimation {
//          PropertyAction { property: "x"; value: pushEnter.ViewTransition.item.pos }
//          NumberAnimation { properties: "y"; from: 200; to: pushEnter.ViewTransition.item.pos?? 0; duration: enableAnimation? 200 : 0; easing.type: Easing.OutCubic }
//          NumberAnimation { property: "opacity"; from: 0; to: 1; duration: enableAnimation ? 400 : 0; easing.type: Easing.OutCubic }
//      }
//   }
//    popExit: Transition {
//    id: popExit
//    ParallelAnimation {
//        PropertyAction { property: "x"; value: popExit.ViewTransition.item.pos }
//        NumberAnimation { properties: "y"; from: 0; to: 100; duration: enableAnimation ? 100 : 0; easing.type: Easing.OutCubic }
//        NumberAnimation { property: "opacity"; from: 1; to: 0; duration: enableAnimation ? 150 : 0 ; easing.type: Easing.OutCubic }
//    }
//  }
}
