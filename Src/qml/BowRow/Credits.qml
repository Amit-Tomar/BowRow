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
        id: creditsHeading
        text: qsTr("Credits")
        font.underline: true
        anchors.top: infoRect.top
        anchors.topMargin: 30
        anchors.verticalCenter: infoRect.verticalCenter
        anchors.horizontalCenter: infoRect.horizontalCenter
        color: "white"
        font.pixelSize: 40
        font.family: "purisa"
    }


    Text
    {
        id: about
        text: " 1. Baloon bursting sound has been taken from www.SoundBible.com "
        font.pixelSize: 20
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 120
    }

    Text
    {
        id: licenceHeading
        text: qsTr("Licence")
        font.underline: true
        anchors.top: infoRect.top
        anchors.topMargin: 230
        anchors.verticalCenter: infoRect.verticalCenter
        anchors.horizontalCenter: infoRect.horizontalCenter
        color: "white"
        font.pixelSize: 40
        font.family: "purisa"
    }


    Text
    {
        id: licence
        text: "   This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>."

        font.pixelSize: 18
        font.family: "purisa"
        color: "white"
        anchors.left: infoRect.left
        anchors.top: infoRect.top
        anchors.leftMargin: 20
        anchors.topMargin: 300
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

                 PropertyChanges {
                     target: licence
                     x: 109
                     y: 322
                     anchors.topMargin: 300
                     anchors.leftMargin: 59
                 }

                 PropertyChanges {
                     target: infoRect
                     x: 50
                     y: 22
                     anchors.horizontalCenterOffset: 0
                     anchors.verticalCenterOffset: -18
                 }

                 PropertyChanges {
                     target: licenceHeading
                     x: 422
                     y: 234
                     anchors.topMargin: 212
                     anchors.horizontalCenterOffset: 2
                     anchors.verticalCenterOffset: -18
                 }

                 PropertyChanges {
                     target: about
                     x: 126
                     y: 156
                     anchors.topMargin: 134
                     anchors.leftMargin: 76
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
