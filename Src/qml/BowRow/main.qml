import QtQuick 1.0
import Qt.labs.particles 1.0
import "gameLogicScript.js" as GameLogicScript

Image
{
    id: root
    width : 1000
    height: 800
    source : "./Images/bg.jpg"

    property int  shootingPower        : 0  // Min : 0 | Max : 30
    property int  level                : 0  // Min : 0 | Max : 5
    property int  windPower            : level * 2 + 2 // Min : 2 | Max : 12
    property int  baloonNumber         : 1  // Min : 1 | Max : 10
    property int  baloonGenerationTime : (6-level) * 700           // Min : 1000 | Max : 6000
    property int  baloonInMotionTime   : baloonGenerationTime * 2  // Min : 2000 | Max : 12000
    property int  totalBaloonsShot     : 0  // Min : 0 | Max : 60
    property int  livesLeft            : 5  // Min : 0 | Max : 5

    property int  totalArrows          : 65  // Min : 0 | Max : 65
    property int  totalBaloons         : 60  // Min : 0 | Max : 60
    property int  totalScore           : 10 * totalBaloonsShot   // Min : 0 | Max : 600

    property int    arrowStartupX : 825

    property string baloon1Source : "./Images/orange.png"
    property string baloon2Source : "./Images/red.png"
    property string baloon3Source : "./Images/green.png"
    property string baloon4Source : "./Images/yellow.png"
    property string baloon5Source : "./Images/peach.png"
    property string baloon6Source : "./Images/purple.png"
    property string baloon7Source : "./Images/blue.png"

    property real arrowAnimationTime : (30 - shootingPower)*100 + 500

    property real  bowX   : bow.x
    property real  bowY   : bow.y
    property alias arrowX : arrow.x
    property alias arrowY : arrow.y

    onLivesLeftChanged: if(livesLeft==-1) gameEnd()

    function fireArrow()
    {
        arrowInMotionTimer.running = true
        arrow.state = "shot"
        -- totalArrows
        console.log ("Fire Arrow")
    }

    // Create the baloons for all stages
    function createStageBaloons(stage)
    {
        for (var i=0; i<10; i++)
        {
            var component = Qt.createComponent("Baloon.qml");            
            var object = component.createObject(root);
            GameLogicScript.addBallons(stage,object)

            // Set Baloon Position
            object.opacity = 0
            object.x = Math.floor((Math.random()*700)+1);
            object.y = 560

            // Set Baloons Colors

            switch (i)
            {
                case 0 :
                    object.source = baloon1Source
                    break;

                case 1 :
                    object.source = baloon5Source
                    break;

                case 2 :
                    object.source = baloon2Source
                    break;

                case 3 :
                    object.source = baloon6Source
                    break;

                case 4 :
                    object.source = baloon3Source
                    break;

                case 5 :
                    object.source = baloon4Source
                    break;

                case 6 :
                    object.source = baloon5Source
                    break;

                case 7 :
                    object.source = baloon6Source
                    break;

                case 8 :
                    object.source = baloon7Source
                    break;

                case 9 :
                    object.source = baloon3Source
                    break;
            }
         }
    }

    function testCollision()
    {
        var object = GameLogicScript.getBaloons(level)

        if(object != 0)
        {
            for (var i=0; i<10; i++)
            {
                if(arrow.x >= object[i].x && arrow.x <= object[i].x+object[i].width && arrow.y >= object[i].y+80 && arrow.y <= object[i].y +150 )
                {
                    baloonShot(i)
                }
            }
        }
    }

    // NOTE: This function gets called multiple times if a baloon is hit by arrow.
    function baloonShot(i)
    {
        console.log("baloon shot : " + i)
        var object = GameLogicScript.getBaloons(level)
        object[i].opacity = 0
        object[i].baloonMoving = false

        bowRowController.play()

        console.log ( "<--->" + bowRowController.getHighestScore() )
        console.log ( "<--->" + bowRowController.getHighestScorer() )
    }

    function startStage(stageNumber)
    {
       console.log ("Starting Level : " + level)
       stageStartTimer.running = true
       stageStartBanner.opacity = .4
       stageStartBannerHidingTimer.running = true
    }

    function gameStart()
    {
        console.log ("----Game Started----")
        startStage(level)
    }

    function gameEnd()
    {
        console.log ("----Game End----")
        console.log ("Score : " + totalScore )
        console.log ("Exis Score : " + bowRowController.getHighestScore() )

        shutDownScreen.opacity = 1        
    }

    Timer
    {
        id: shutDownScreenTimer
        repeat: false
        running: false
        interval: 2000
        onTriggered:
        {
            Qt.quit()
        }
    }

    Timer
    {
        id: stageStartBannerHidingTimer
        repeat: false
        running: false
        interval: 300
        onTriggered:
        {
            stageStartBanner.opacity = 0
        }
    }

    Timer
    {
        id: stageStartTimer
        repeat: true
        running: false
        interval: baloonGenerationTime
        onTriggered:
        {
            if( baloonNumber <= 10 )
            {
               var object = GameLogicScript.getBaloons(level)

               object[baloonNumber-1].opacity = 1
               object[baloonNumber-1].y = 0
               object[baloonNumber-1].baloonMoving = true

                -- totalBaloons
            }

            ++ baloonNumber

            if(12 == baloonNumber)
            {
                baloonNumber = 1
                ++ level
                stageStartTimer.running = false
                startStage(level)               
            }
        }
    }

    Timer
    {
        id: arrowInMotionTimer
        repeat: false
        running: false
        interval: arrowAnimationTime
        onTriggered:
        {
            console.log ("Arrow Moving")
            arrow.state = ""
            arrowX = arrowStartupX
            arrowY = bowY + 60
            shootingPower = 0
            arrow.opacity = totalArrows == 0 ? 0 : 1
        }
    }

    Image
    {
        id: bow
        x: 900
        y: 100
        source: "./Images/bow_mine.png"
        smooth: true       

        Behavior on y { SpringAnimation { spring: 20; damping: 0.5 ; duration: 500} }

        onYChanged:
        {
            if(arrow.state == "")
               arrowY = bowY + 60
        }

        MouseArea
        {
           id: bowMouseArea
           anchors.left: parent.left
           anchors.right: parent.right
           anchors.top: parent.top
           anchors.bottom: parent.bottom
           anchors.leftMargin: -50
           anchors.rightMargin: -50
           anchors.topMargin: -50
           anchors.bottomMargin: -50

           drag.target: parent
           drag.axis: Drag.YAxis
           drag.minimumY: 100
           drag.maximumY: 650
        }
    }

    Image
    {
        id: arrow
        x: arrowStartupX
        y: 158
        source: "./Images/arrow_mine.png"
        smooth: true
        rotation: 0
        scale : .9

        onXChanged:
        {
            if(true == arrowMouseArea.pressed)
            {
                shootingPower = arrow.x - arrowStartupX
            }

            testCollision()
        }

        MouseArea
        {
           id: arrowMouseArea
           anchors.fill: parent
           drag.target: parent
           drag.axis: Drag.XAxis
           drag.minimumX: arrowStartupX
           drag.maximumX: 855

           onReleased:
           {
               if(arrow.x > arrowStartupX)
               {
                    fireArrow()
               }
           }
        }

        states:
        [
                 State
                 {
                     name: "shot"
                     PropertyChanges { target: arrow;  x: -arrow.width  }
                     PropertyChanges { target: arrow;  y:  bowY+50 + windPower*10  }
                     PropertyChanges { target: arrow;  rotation: -windPower * 1.5  }
                 }
        ]

        transitions:
        [
                 Transition
                 {
                     from: ""
                     to: "shot"
                     NumberAnimation { target: arrow; properties: "x,y,rotation" ; duration: arrowAnimationTime  }
                 }
        ]
    }

    Image
    {
        id: baloon
        x: 204
        y: 566
        scale: .5
        source: "./Images/orange.png"
        smooth: true
        opacity: 0

        Behavior on y       { NumberAnimation { duration : 8000 * level } }
        Behavior on opacity { NumberAnimation {duration: 300} }
        Behavior on scale   { NumberAnimation {duration: 300} }
    }

    Timer
    {
        id: particleOffTimer
        interval: 300
        running: false
        repeat: false
        onTriggered: particles.opacity = 0
    }


    Text {
        id: numberOfArrowsLeftBanner
        x: 23
        y: 50
        text: qsTr("Arrows Left : " + totalArrows)
        font.pixelSize: 18
        font.family: "purisa"
        font.bold: true
        color: "white"
    }

    Text {
        id: numberOfLifesLeftBanner
        anchors.left: infoRectangle.left
        anchors.leftMargin: 15
        anchors.top: infoRectangle.top
        anchors.topMargin: 5
        text: qsTr("Lives Left : " + livesLeft)
        font.pixelSize: 18
        font.family: "purisa"
        font.bold: true
        color: "white"
    }

    Text {
        id: numberOfBaloonsLeftBanner
        anchors.left: numberOfLifesLeftBanner.left
        anchors.bottom: numberOfLifesLeftBanner.top
        anchors.bottomMargin: 10
        text: qsTr("Baloons Left: " + totalBaloons )
        font.pixelSize: 18
        font.family: "purisa"
        font.bold: true
        color: "white"
    }

    Rectangle {

        id: infoRectangle
        x: 9
        y: 12
        width: 983
        height: 70
        radius: 15
        color: "#ffffff"
        opacity: 0.130        
    }

    Rectangle
    {
        id: powerRectangle
        x: 820
        y: 25
        width: 150
        height: 15
        radius: 5
        color: "#ffffff"
        smooth: true
        opacity: .8

        Rectangle
        {
            id: powerRectangleFill
            width: shootingPower * 5
            radius: 5
            height: 15
            smooth: true
            color: "orange"
        }
    }

        Text
        {
            id: windBanner
            x: 890
            y: 50
            text: "Wind: " + windPower
            font.pixelSize: 18
            font.bold: true
            font.family: "purisa"
            color: "white"
        }

    Image
    {
        source: "./Images/close.png"
        scale: .25
        smooth: true
        anchors.right: root.right
        anchors.rightMargin: -35
        anchors.topMargin  : -35
        anchors.top: root.top
        z: 15


        MouseArea
        {
            anchors.fill: parent
            onClicked:  Qt.quit()
        }
    }

    Text
    {
        id: powerBanner
        text: "Power"
        anchors.right: infoRectangle.right
        anchors.top: infoRectangle.top
        anchors.rightMargin: 180
        anchors.topMargin:  5
        font.pixelSize: 18
        font.family: "purisa"
        color: "white"
        font.bold: true
    }

    Text
    {
        id: scoreBanner
        text: "Points : " + totalScore
        anchors.left: powerBanner.left
        anchors.top: powerBanner.bottom
        anchors.topMargin:  0
        font.pixelSize: 18
        font.family: "purisa"
        font.bold: true
        color: "white"
    }

    Text
    {
        id: powerPercentBanner
        text:  Math.floor( powerRectangleFill.width / powerRectangle.width * 100 ) + " %"
        color: "black"
        anchors.centerIn: powerRectangle
    }

    Text
    {
        id: levelBanner
        text:  //
               if(level == 0)
               { "Level : " +  "Beginner"}
               else if(level == 1)
               { "Level : " +  "Novice"}
               else if(level == 2)
               { "Level : " +  "Easy"}
               else if(level == 3)
               { "Level : " +  "Difficult"}
               else if(level == 4)
               { "Level : " +  "Very Difficult"}
               else
               { "Level : " +  "Expert"}


        font.pixelSize: 30
        anchors.centerIn: infoRectangle
        font.family: "purisa"
        font.bold: true
        color: "white"
    }


    Rectangle
    {
        id: stageStartBanner
        x: 314
        y: 300
        width: 358
        height: 192
        color: "#ffffff"
        radius: 26
        opacity: 0.4

        Behavior on opacity { NumberAnimation {duration : 1000} }
    }

    Text
    {
        id: stageStartBannerText
        anchors.centerIn: stageStartBanner
        text: "Level " + level + " starting.."
        font.pixelSize: 25
        font.bold: true
        opacity: stageStartBanner.opacity == 0 ? 0 : 1
        font.family: "purisa"
        color: "white"
        Behavior on opacity { NumberAnimation {duration : 100} }
    }

    HomeScreen
    {
        id: homeScreen
        z: 2

        Behavior on opacity { NumberAnimation {duration : 1000  } }

        onStartTheGame:
        {
            homeScreen.opacity = 0
            gameStart()
        }

        onShowRules:
        {
            rulesScreen.state = "MAXIMIZED"
        }

        onShowAbout:
        {
            aboutScreen.state = "MAXIMIZED"
        }

        onShowCredits:
        {
            creditsScreen.state = "MAXIMIZED"
        }

        onShowHighScores:
        {
            highScores.state = "MAXIMIZED"
        }

    }

    Rules
    {
        id: rulesScreen
        anchors.centerIn: parent
        z: 3
    }

    About
    {
        id: aboutScreen
        anchors.centerIn: parent
        z: 3
    }

    Credits
    {
        id: creditsScreen
        anchors.fill: parent
        z: 3
    }

    ShutDownScreen
    {
        id: shutDownScreen
        z: 5
        opacity : 0
    }

    HighScores
    {
        id: highScores
        anchors.fill: parent
        z: 3
    }

    Component.onCompleted:
    {
        for (var i=0; i<=5 ; i++)
            createStageBaloons(i)
    }
}
