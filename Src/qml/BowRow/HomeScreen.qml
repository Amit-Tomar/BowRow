import QtQuick 1.0

Image
{
    id: home
    source: "./Images/homeScreen.jpg"

    signal startTheGame()
    signal showHighScores()
    signal showCredits()
    signal showRules()
    signal showAbout()

    Column
    {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 350
        anchors.topMargin: 300
        spacing: 20

         Text
         {
           id: newGame
           text: "Start New Game"
           font.family: "purisa"
           font.pixelSize: 35
           color: mouseNewGame.pressed == true ? "grey" : "white"
           smooth: true

           MouseArea
           {
              id: mouseNewGame
              anchors.fill: parent
              onClicked: startTheGame()
           }
        }

         Text
         {
           id: highScores
           x: 30
           text: "High Scores"
           font.pixelSize: 35
           color: "white"
           smooth: true
           font.family: "purisa"

           MouseArea
           {
              id: mouseHighScores
              anchors.fill: parent
              onClicked: showHighScores()
           }
         }

         Text
         {
           id: credits
           x: 75
           text: "Credits"
           font.family: "purisa"
           font.pixelSize: 35
           color: mouseCredits.pressed == true ? "grey" : "white"
           smooth: true

           MouseArea
           {
              id: mouseCredits
              anchors.fill: parent
              onClicked: showCredits()
           }
         }

         Text
         {
           id: rules
           x: 95
           text: "Rules"
           font.family: "purisa"
           font.pixelSize: 35
           color: mouseRules.pressed == true ? "grey" : "white"
           smooth: true

           MouseArea
           {
              id: mouseRules
              anchors.fill: parent
              onClicked: showRules()
           }
         }



         Text
         {
           id: about
           x: 90
           font.family: "purisa"
           text: "About"
           font.pixelSize: 35
           color: mouseAbout.pressed == true ? "grey" : "white"
           smooth: true

           MouseArea
           {
              id: mouseAbout
              anchors.fill: parent
              onClicked: showAbout()
           }
        }
    }

}
