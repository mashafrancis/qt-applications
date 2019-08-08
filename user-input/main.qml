import QtQuick 2.13
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("User Input Demo")

    function setColorByX(x)
    {
        var MAX= 256
        var exp = Math.floor(x/MAX)
        var mult = Math.pow(256,exp)
        var operand = x % MAX
        var result = "#" + (operand * mult + 0xaa0000).toString(16)
        print (x, exp, mult, operand, result)
        return result
    }

    Rectangle
    {
        id: containerId
        width: 600; height: 200
        Rectangle{
            id :dragRectId
            function isKey2Pressed(event)
            {
                if (event.key === Qt.Key_2)
                    print ("key 2 pressed")
                else if (event.key === Qt.Key_Control)
                {
                    print (".")
                }
                else print ("Detected key press" + event.key)
            }

            width: 50 ; height : width
            color : setColorByX(x)
            MouseArea
            {
                anchors.fill : parent
                drag.target: dragRectId
                drag.axis:  Drag.XAxis
                drag.minimumX: 0
                drag.maximumX:  containerId.width - dragRectId.width
            }
            //Keys.priority: Keys.AfterItem
            KeyNavigation.down : simpleDemoId
            KeyNavigation.priority: KeyNavigation.BeforeItem

            Keys.onDigit0Pressed:  radius = 0
            Keys.onDigit1Pressed: {radius = 25; event.accepted = false}
            Keys.onPressed: isKey2Pressed(event)
            Keys.onDigit3Pressed:  {if (event.modifiers === Qt.ControlModifier) print ("Saw control 3")}
            focus : true

        }
    }

    Rectangle{
        id : simpleDemoId
        anchors.top: containerId.bottom
        width: 50
        height : width
        color: "black"
        MouseArea{
            anchors.fill: parent
            onClicked: parent.x ===0 ? parent.x = 50 : parent.x = 0
            hoverEnabled:  true
            onHoveredChanged: containsMouse ? parent.color = "teal" : parent.color = "cyan"
        }
        KeyNavigation.up : dragRectId
        KeyNavigation.priority: KeyNavigation.BeforeItem
        Keys.onPressed: print ("simpleDemoId "+ event.key)

    }
}
