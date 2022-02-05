#include "appengine.h"

appEngine::appEngine(QObject *parent) : QObject(parent)
{

}

void appEngine::writeTextToFile(QString count, QString typeOfFile)
{
    QString fileName = choosePath(typeOfFile);

    QFile file(fileName);

    file.open(QIODevice::WriteOnly | QIODevice::Text);

    QTextStream out(&file);

    out << count;

    file.close();
}

QString appEngine::choosePath(QString typeOfFile)
{
    if (typeOfFile == "img")
    {
        return QFileDialog::getSaveFileName(NULL, tr("Choose a filename to save under"), QString(), tr("PNG(*.png);;JPG(*.jpg);;BMP(*.bmp);;All Files(*)"));
    }

    else if (typeOfFile == "txt")
    {
        return QFileDialog::getSaveFileName(NULL, tr("Choose a filename to save under"), QString(), tr("TXT(*.txt);;LOG(*.log)"));
    }

    else
    {
        return QFileDialog::getSaveFileName(NULL, tr("Choose a filename to save under"), QString(), tr("All Files(*)"));
    }
}

void appEngine::openVideoWindow(QString time)
{
    MainWindow *oCVwindow = new MainWindow;

    oCVwindow->show();

    connect(oCVwindow, &MainWindow::goToNext, this, &appEngine::openNextWindow);
}

void appEngine::openNextWindow(QString path)
{
    emit sendToQml(QString("./gg.txt"));
}

