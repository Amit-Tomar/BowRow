import QtQuick 1.0

Rectangle
{
    width: 1000
    height: 800
    color: "black"

    Text
    {
        id: name
        x: 346
        y: 60
        text: "Game Over"
        font.bold: true
        anchors.verticalCenterOffset: -299
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent
        font.pixelSize: 50
        color: "#5a5959"
        font.family: "purisa"
    }

    Text
    {
        id: score
        x: 412
        y: 196
        text: "Total score: " + totalScore
        anchors.topMargin: 25
        anchors.top:  name.bottom
        anchors.left: name.left
        anchors.leftMargin: 45
        font.pixelSize: 30
        color: "#ffffff"
        font.family: "purisa"
    }

    Text
    {
        id: scorer_highest
        x: 332
        y: 351
        text: "Highest scorer: " + bowRowController.getHighestScorer()
        font.family: "purisa"
        anchors.topMargin: 167
        anchors.top:  name.bottom
        anchors.left: name.left
        anchors.leftMargin: -14
        font.pixelSize: 30
        color: "#847979"
    }

    Text
    {
        id: score_highest
        x: 414
        y: 389
        text: "Score : " + bowRowController.getHighestScore()
        font.family: "purisa"
        anchors.topMargin: 247
        anchors.top:  name.bottom
        anchors.left: name.left
        anchors.leftMargin: 68
        font.pixelSize: 30
        color: "#847979"
    }

    TextInput
    {
        id: text_input1
        x: 188
        y: 700
        width: 663
        height: 46
        color: "#717171"
        text: qsTr("name")
        font.family: "Purisa"
        font.pixelSize: 34
        opacity: totalScore > bowRowController.getHighestScore() ? 1 : 0
    }

    Text
    {
        id: text1
        x: 346
        y: 616
        color: "#887d7d"
        text: qsTr("Enter your name")
        font.family: "Purisa"
        font.pixelSize: 35
        opacity: totalScore > bowRowController.getHighestScore() ? 1 : 0
    }

    Rectangle {
        id: rectangle1
        x: 188
        y: 700
        width: 663
        height: 46
        color: "#ffffff"
        radius: 9
        opacity: totalScore > bowRowController.getHighestScore() ? .18 : 0
    }

    Text
    {
        id: text2
        x: 19
        y: 498
        color: "#a2a2a2"
        text: qsTr("Congrats!!! You broke the record..")
        font.bold: true
        font.pixelSize: 45
        font.family: "Purisa"
        opacity: totalScore > bowRowController.getHighestScore() ? 1 : 0
    }

    Rectangle
    {
        id: rectangle2
        x: 872
        y: 700
        width: 94
        height: 46
        color: "#ffffff"
        radius: 6
        opacity: totalScore > bowRowController.getHighestScore() ? goButtonMouseArea.pressed ? .15 : 0.250 : 0

        MouseArea
        {
            id: goButtonMouseArea
            anchors.fill: parent
            onClicked:
            {
                bowRowController.setHighestScorerData( text_input1.text, totalScore )
                score_highest.text =  "Highest score : " + totalScore
                scorer_highest.text = "Highest scorer: " + text_input1.text
                text3.opacity = 0
                text2.opacity = 0
                text1.opacity = 0
                rectangle1.opacity = 0
                rectangle2.opacity = 0
                text_input1.opacity = 0
            }
        }
    }

    Text
    {
        id: text3
        x: 898
        y: 700
        width: 88
        height: 46
        color: "#888888"
        text: qsTr("Go")
        font.family: "Purisa"
        font.pixelSize: 36
        opacity: totalScore > bowRowController.getHighestScore() ? 1 : 0
    }

    Rectangle {
        id: rectangle3
        x: 222
        y: 262
        width: 604
        height: 198
        color: "#ffffff"
        radius: 35
        opacity: .1
    }
}
