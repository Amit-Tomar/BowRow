#include "BowRowSettings.h"

BowRowSettings::BowRowSettings(QObject *parent) :
    QObject(parent)
{
    mediaObject = new Phonon::MediaObject();
    audioOutput = new Phonon::AudioOutput(Phonon::MusicCategory);
    Phonon::Path path = Phonon::createPath(mediaObject, audioOutput);    
}

void BowRowSettings::play()
{
    //mediaObject->setCurrentSource(Phonon::MediaSource("../BowRow/pop.mp3"));
    mediaObject->setCurrentSource(Phonon::MediaSource("qml/BowRow/pop.mp3"));
    mediaObject->play();
}

void BowRowSettings::storeHighestScore(QString name, QString score)
{
    FILE *pReadFile;
    char cTemp;

    pReadFile=fopen ( "HighestScore.txt" , "r+");

    if (pReadFile==NULL )
    {
        std::cout << ("Error opening Settings Config file");
        fclose(pReadFile);
        return ;
    }

    cTemp = fgetc (pReadFile);

    while( cTemp != EOF )
    {
        char c ;
    }
}

int BowRowSettings::getHighestScore()
{
    FILE *pReadFile;
    char cTemp;

    pReadFile=fopen ( "./qml/BowRow/HighestScore.txt" , "r+");

    if (pReadFile==NULL )
    {
        std::cout << ("Error opening Settings Config file") << std::endl;
        return 0 ;
    }

    cTemp = fgetc (pReadFile);
    QString score ;

    while( cTemp != EOF && cTemp != ' ' )
    {
        std::cout << "-" << cTemp << "-" << std::endl ;
        score += cTemp ;

        cTemp = fgetc (pReadFile);
    }

    fclose (pReadFile);

    std::cout << "-" << score.toStdString() << std::endl ;

    return score.toInt();
}

QString BowRowSettings::getHighestScorer()
{
    FILE *pReadFile;
    char cTemp;

    pReadFile=fopen ( "./qml/BowRow/HighestScore.txt" , "r+");

    if (pReadFile==NULL )
    {
        std::cout << ("Error opening Settings Config file") << std::endl;
        return "" ;
    }

    cTemp = fgetc (pReadFile);
    QString scorer ;

    while( cTemp != EOF && cTemp != ' ' )
    {
        cTemp = fgetc (pReadFile);
    }

    cTemp = fgetc (pReadFile);

    while( cTemp != EOF )
    {
        scorer += cTemp ;
        cTemp = fgetc (pReadFile);
    }

    fclose (pReadFile);
    return scorer;
}

void BowRowSettings::setHighestScorerData(QString name, QString score)
{
    std::cout << "Here" << std::endl ;

    name = name.left(12);

    FILE *pReadFile=NULL;
    pReadFile=fopen ( "./qml/BowRow/HighestScore.txt" , "w");

    if (pReadFile==NULL )
    {
        std::cout << ("Error opening Settings Config file") << std::endl;
        return;
    }

    std::string temp = score.toStdString() ;
    temp += " " +  (name.toStdString()) ;

    fputs( temp.c_str() , pReadFile );
    fclose (pReadFile);
}
