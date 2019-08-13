import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    Component.onCompleted:
    {
        messageClass.message = "Changed from QML"
    }

//    Connections{
//        target: messageClass
//        onMessageChanged: textId.text = value;
//    }
    function javaScriptFunction(value) {
        print("C++ called the javaScriptFunction with then parameter:" + value)
        return "This message was returned from a Javascript function."
    }

    function logger(element){
        print("Array element: " + element)
    }

    function logArray(anArray){
        anArray.forEach(logger)
    }

    function logMap(theMap){
        for (var element in theMap){
            print("Object item:", element, "=", theMap[element])
        }
    }

    Column {
        Text {
            id: textId
            text: messageClass.message
        }
        Button {
            text: "Change Text"
            onClicked: messageClass.doMessageChange()
        }
        Button {
            text: "Talk to C++"
            onClicked: {
                var result = messageClass.sendMessageFromCpp("This is QML saying hi")
                print("QML Received " + result)
            }
        }
    }
}
