import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Focus Scope Demo")

    Column{
        anchors.centerIn: parent
        spacing: 5
        MyWidget{}
        MyWidget{
            color :"lightseagreen"
            focus : true
        }
    }
}
