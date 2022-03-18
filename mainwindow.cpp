#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "videocapture.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // calling the destructor when closing the window
    setAttribute(Qt::WA_DeleteOnClose);

    mOpenCV_videoCapture = new VideoCapture(this);
    connect(mOpenCV_videoCapture, &VideoCapture::newPixmapCaptured, this, [&]()
    {
        ui->opencvFrame->setPixmap(mOpenCV_videoCapture->pixmap().scaled(1258, 663));
    });

    connect(mOpenCV_videoCapture, &VideoCapture::endRecording, this, &MainWindow::closeWindow);

    connect(this, &MainWindow::set_time, mOpenCV_videoCapture, &VideoCapture::time_setup);
    connect(this, &MainWindow::selected_color, mOpenCV_videoCapture, &VideoCapture::select_color);
}

MainWindow::~MainWindow()
{
    mOpenCV_videoCapture->terminate();

    delete mOpenCV_videoCapture;

    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    mOpenCV_videoCapture->start(QThread::HighestPriority);
}

void MainWindow::closeWindow()
{
    emit goToNext(QString("./gg.txt"));

    MainWindow::~MainWindow();
}




void MainWindow::on_blueColorRB_clicked()
{
    emit selected_color("blue");
}


void MainWindow::on_greenColorRB_clicked()
{
    emit selected_color("green");
}

