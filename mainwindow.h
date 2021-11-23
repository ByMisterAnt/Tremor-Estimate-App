#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class VideoCapture;

namespace Ui
{
    class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:

    explicit MainWindow(QWidget *parent = nullptr);

    ~MainWindow();

signals:

    void goToNext(QString);

private slots:

    void on_pushButton_clicked();

    void closeWindow();

private:

    Ui::MainWindow *ui;

    VideoCapture *mOpenCV_videoCapture;
};

#endif // MAINWINDOW_H
