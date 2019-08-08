import QtQuick 2.13
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Text Input Demo")
    property int textMargin : 5
    property int textBorderWidth : 2

    Rectangle{
        id : textInputRectId
        color : "honeydew"
        x : 10;y:10
        width : 100 ; height : textInputId.implicitHeight + 2 * textMargin
        radius : textMargin
        border.width : textBorderWidth
        border.color : "olivedrab"

        TextInput{
            id: textInputId
            text :"12345"
            validator: RegExpValidator{regExp: /^\d{5}(?:[-\s]\d{4})?$/}
            wrapMode: TextInput.Wrap
            anchors.margins: textMargin
            anchors.fill:  parent
        }

        Flickable{
            contentHeight: textEditId.height
            width : textEditId.width
            height : 75
            clip : true
            anchors.top : textInputId.bottom
            anchors.topMargin : 20

            TextEdit{
                id: textEditId
                width: 100
                clip : true
                wrapMode : TextEdit.WrapAnywhere

                textFormat: TextEdit.RichText
                text : "<b>This</b> is a text area and it can take multiple lines "
                       +"<font color='blue'>of text.</font> You just enter a new line \n or a cr \r to it. "
                       +"if you write with a streamofconciousenessrunonstyle you can"
                       +"see how word wrap works. "
            }
        }


    }
}
