#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QFileDialog>
#include <QTextStream>

class appEngine : public QObject
{
    Q_OBJECT
public:
    explicit appEngine(QObject *parent = 0);

signals:

    void sendToQml(QString message);

public slots:

    void writeTextToFile(QString areasText);

};

#endif // APPENGINE_H
