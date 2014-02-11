// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image
{
    id: root
    source : "./Images/bg.jpg"

    scale: .001
    opacity: .001

    Rectangle
    {
        id: infoRect
        anchors.centerIn: parent
        width: 1000*.9
        height: 800*.9
        radius: 15
        color: "#ffffff"
        opacity: 0.15
    }


    Text
    {
        id: about
        text: bowRowController.getHighestScorer() + " : "  + bowRowController.getHighestScore()
        font.pixelSize: 60
        font.family: "purisa"
        color: "white"
        anchors.centerIn: infoRect
    }


    Text
    {
        id: licence
        text: bowRowController.getHighestScore()
        font.pixelSize: 60
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 300
        opacity: 0
    }


    Image
    {
        id: close
        source: "./Images/close.png"
        scale: .35
        smooth: true
        anchors.right: infoRect.right
        anchors.top : infoRect.top
        anchors.rightMargin: -25
        anchors.topMargin: -25

        MouseArea
        {
            anchors.fill: parent
            onClicked: root.state = ""
        }
    }

    Rectangle {
        id: rectangle1
        x: 174
        y: 136
        width: 200
        height: 200
        color: "#ffffff"
        opacity: 0
    }

    states:
        [
             State
             {
                 name: "MAXIMIZED"
                 PropertyChanges { target: root; scale: 1; opacity : 1}

                 PropertyChanges {
                     target: licence
                     x: 239
                     y: 398
                     font.pixelSize: 25
                     anchors.topMargin: 358
                     anchors.leftMargin: 189
                 }

                 PropertyChanges {
                     target: rectangle1
                     x: 174
                     y: 108
                     width: 678
                     height: 534
                     radius: 10
                     opacity: 0.170
                 }
             }
         ]

         transitions:

         [
             Transition
             {
                 reversible: true
                 from: ""
                 to: "MAXIMIZED"
                 NumberAnimation { target: root; properties: "scale,opacity" ; duration: 500}
             }
         ]

}
