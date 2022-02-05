#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QFileDialog>
#include <QTextStream>
#include <mainwindow.h>

class appEngine : public QObject
{
    Q_OBJECT

public:

    explicit appEngine(QObject *parent = 0);

signals:

    void sendToQml(QString message);

public slots:

    void writeTextToFile(QString areasText, QString typeOfFile);

    QString choosePath(QString typeOfFile);

    void openVideoWindow(QString time);

    void openNextWindow(QString path);

};

#endif // APPENGINE_H
