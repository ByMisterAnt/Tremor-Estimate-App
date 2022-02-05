#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "videocapture.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    mOpenCV_videoCapture = new VideoCapture(this);
    connect(mOpenCV_videoCapture, &VideoCapture::newPixmapCaptured, this, [&]()
    {
        ui->opencvFrame->setPixmap(mOpenCV_videoCapture->pixmap().scaled(1258, 663));
    });

    connect(mOpenCV_videoCapture, &VideoCapture::endRecording, this, &MainWindow::closeWindow);
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

