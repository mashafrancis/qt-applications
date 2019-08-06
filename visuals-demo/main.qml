import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Rectangle")

    Item {
        anchors.centerIn: parent
        Rectangle {
            id: firstRectId
            width: 50
            height: 50
            color: "#ff0000"
        }
        Rectangle {
            width: firstRectId.width
            height: firstRectId.height
            color: "#1c87b1"
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#0d9499";
                }
                GradientStop {
                    position: 1.00;
                    color: "#92cf2f";
                }
            }
            opacity: .5
            anchors.left: firstRectId.right
            anchors.leftMargin: -15
            visible: true
        }
    }
}
