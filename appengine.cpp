#include "appengine.h"

appEngine::appEngine(QObject *parent) : QObject(parent)
{
}

void appEngine::writeTextToFile(QString count)
{
    QString fileName = QFileDialog::getSaveFileName(NULL, tr("Choose a filename to save under"), QString(),
                                                        tr("TXT(*.txt);;LOG(*.log)"));
    QFile file(fileName);
    file.open(QIODevice::WriteOnly | QIODevice::Text);
    QTextStream out(&file);
    out << count;
    file.close();

}
