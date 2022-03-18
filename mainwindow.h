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

    void set_time(double time);

    void selected_color(QString color);

private slots:

    void on_pushButton_clicked();

    void closeWindow();

    void on_blueColorRB_clicked();

    void on_greenColorRB_clicked();

private:

    double record_time;

    Ui::MainWindow *ui;

    VideoCapture *mOpenCV_videoCapture;
};

#endif // MAINWINDOW_H
