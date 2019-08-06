import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string myString: "masha"

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }
    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }

    VerticalField {
        vFieldLabelId.text: "A new label"
        vFieldTextId.text: "1000"
    }

    Rectangle {
        width: textId.implicitWidth+10
        height: textId.implicitHeight+5
        color: "dodgerblue"
        anchors.centerIn: parent
        Text {
            id: textId
            text: myString
            anchors.centerIn: parent
            font.pixelSize: 24
        }
    }
}
