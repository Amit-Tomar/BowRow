import QtQuick 1.0
import Qt.labs.particles 1.0


Image
{
    id: baloon
    x: 204
    y: 566
    scale: .5
    source: "./Images/orange.png"
    smooth: true

    property bool baloonMoving: false

    onYChanged: { if(0==y) { opacity = 0 ; particles.opacity = 1 } }

    onBaloonMovingChanged:
    {
        if(baloonMoving==false) ++totalBaloonsShot

    }

    Behavior on y       { NumberAnimation { duration : baloonInMotionTime } }
    Behavior on opacity { NumberAnimation { duration: 500} }

    Particles
    {
        id: particles
        width: 50; height: 50
        x: 30
        y: 50

        opacity: !baloonMoving
        enabled: false
        lifeSpan: 500
        count: 5000
        emissionRate: 600
        lifeSpanDeviation: 600
        angle: 0; angleDeviation: 360;
        velocity: 100; velocityDeviation: 30
        source: "./Images/star.png";

        Behavior on opacity { NumberAnimation { duration: 100} }
    }


    Timer
    {
       id: baloonMotionTimer
       running: baloonMoving
       repeat: false
       interval: baloonInMotionTime
       onTriggered: -- livesLeft
    }
}
