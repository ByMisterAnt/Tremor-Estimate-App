#ifndef VIDEOCAPTURE_H
#define VIDEOCAPTURE_H
#include <QPixmap>
#include <QImage>
#include <QThread>
#include <opencv2/opencv.hpp>
#include <QVector>
#include <iostream>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgproc.hpp>
#include <stdio.h>
#include <fstream>
#include <algorithm>
#include <QElapsedTimer>

#define ID_CAMERA 0

class VideoCapture : public QThread
{
    Q_OBJECT

public:

    VideoCapture(QObject *parent = nullptr);

    QPixmap pixmap() const
    {
        return mPixmap;
    }

signals:

    void newPixmapCaptured();

    void endRecording();

public slots:

    void time_setup(double time);

    void select_color(QString color);

protected:

    void run();

private:

    QElapsedTimer timer;

    QPixmap mPixmap;

    cv::Mat mFrame, img, result;

    cv::VideoCapture mVideoCap;

    double dM01, dM10, dArea, x, y;

    double stopTime = 15, recTime = 0, x0 = 1920 / 2 * 0.179, y0 = 1080 / 2 * 0.179;

    QVector <double> X, Y, time;

    QString file_path;

    std::ofstream out;

    QImage  cvMatToQImage( const cv::Mat &inMat );

    QPixmap cvMatToQPixmap( const cv::Mat &inMat );

    // Color Range
    cv::Scalar colorLeftRange = {94, 122, 95}, colorRightRange = {150, 255, 255};
};

#endif // VIDEOCAPTURE_H
