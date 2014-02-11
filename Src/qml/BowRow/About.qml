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
        id: rulesHeading
        text: qsTr("BowRow 1.0")
        font.underline: true
        anchors.top: infoRect.top
        anchors.topMargin: 30
        anchors.verticalCenter: infoRect.verticalCenter
        anchors.horizontalCenter: infoRect.horizontalCenter
        color: "white"
        font.pixelSize: 50
        font.family: "purisa"
    }


    Text
    {
        id: about
        text: "1. This is first version of the game BowRow (name derived from Bow/Arrow) \n It is inspired from a very similiar game in the old Atari games.   "
        font.pixelSize: 20
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 150
    }

    Text
    {
        id: about2
        text: "2. All Images used in this game have been drawn using GIMP, the opensource\nimage editor."
        font.pixelSize: 20
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 250
    }

    Text
    {
        id: about3
        text: "3. Game is written using Qt-C++ / QML / Java script."
        font.pixelSize: 20
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 350
    }

    Text
    {
        id: about4
        text: "4. Game is written for a resolution of 1000x800"
        font.pixelSize: 20
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 450
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

    states:
        [
             State
             {
                 name: "MAXIMIZED"
                 PropertyChanges { target: root; scale: 1; opacity : 1}
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
