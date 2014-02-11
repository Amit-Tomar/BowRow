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
        opacity: 0.05
    }

    Text
    {
        id: rulesHeading
        text: qsTr("Rules")
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
        id: rules
        text: " 1. There are total 60 Baloons, and 65 arrows provided to burst them.\n 2. You have to burst the baloons before they reach top.\n 3. For each baloon being hit, you get 10 points.\n 4. You have 5 lives. A life is lost if a baloon reaches top before being hit."
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
        id: physicsHeading
        text: qsTr("Physics")
        font.underline: true
        anchors.top: infoRect.top
        anchors.topMargin: 280
        anchors.verticalCenter: infoRect.verticalCenter
        anchors.horizontalCenter: infoRect.horizontalCenter
        color: "white"
        font.pixelSize: 40
        font.family: "purisa"
    }

        Text
        {
            id: physics
            text: " 1. There is top to down wind flowing in the environment.\n 2. Due to this wind, your arrows will not move in a straight line. \n 3. With each new stage, power of this wind increases. \n 4. Higher the power more curved is the trajectory of arrow."
            font.pixelSize: 20
            font.family: "purisa"
            color: "white"
            anchors.left: infoRect.left
            anchors.top: infoRect.top
            anchors.leftMargin: 20
            anchors.topMargin: 380
        }

        Text
        {
            id: issuesHeading
            text: qsTr("Known Issues")
            font.underline: true
            anchors.top: infoRect.top
            anchors.topMargin: 540
            anchors.verticalCenter: infoRect.verticalCenter
            anchors.horizontalCenter: infoRect.horizontalCenter
            color: "white"
            font.pixelSize: 40
            font.family: "purisa"
        }

            Text
            {
                id: issues
                text: " 1. When baloon reaches top, in some cases , life decrement takes time.\n  "
                font.pixelSize: 20
                font.family: "purisa"
                color: "white"
                anchors.left: infoRect.left
                anchors.top: infoRect.top
                anchors.leftMargin: 20
                anchors.topMargin: 620
            }

            Text
            {
                id: issues2
                text: " 2. When first baloon is bursted, there is slight jerk, probably due to \n    Phonon initialization. "
                font.pixelSize: 20
                font.family: "purisa"
                color: "white"
                anchors.left: infoRect.left
                anchors.top: infoRect.top
                anchors.leftMargin: 20
                anchors.topMargin: 640
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
                     target: physics
                     x: 70
                     y: 410
                     anchors.topMargin: 370
                     anchors.leftMargin: 20
                 }

                 PropertyChanges {
                     target: issuesHeading
                     x: 354
                     y: 564
                     anchors.topMargin: 524
                     anchors.horizontalCenterOffset: 1
                     anchors.verticalCenterOffset: -16
                 }

                 PropertyChanges {
                     target: issues
                     x: 70
                     y: 636
                     anchors.topMargin: 596
                     anchors.leftMargin: 20
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
