#include <QtGui/QApplication>
#include <QDeclarativeContext>
#include "qmlapplicationviewer.h"
#include <BowRowSettings.h>

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setWindowFlags(Qt::SplashScreen);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);

    BowRowSettings objBowRowSettings;
    viewer.rootContext()->setContextProperty  ("bowRowController", &objBowRowSettings);

    viewer.setMainQmlFile(QLatin1String("qml/BowRow/main.qml"));
    viewer.showExpanded();



    return app->exec();
}
