import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string biohazard: "\u2623";
    property string bullet32 : "<img src='BlueBullet.png' width='32' height ='32' />"

    Text {
        id: upperTextId
        x:20
        y:20
        text: qsTr("%0A demonstration of TEXT properties.%0".arg(biohazard))
        // textFormat: Text.StyledText
        // style:Text.Outline
        styleColor: "green"
        width: 100
        font{
            family: "arial unicode ms"
            italic: true
            pointSize: 24
            weight: Font.Light
        }
        color :"#A00"
    }
    Text{
        id:lowerTextId
        text:"%0this is a bulleted item".arg(bullet32)
        anchors.top: upperTextId.bottom
        font{
            family: "adobe caslon pro bold"
            pointSize: 24
        }
    }
}
