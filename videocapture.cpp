#include "videocapture.h"
#include <QFileDialog>
#include <QFile>
#include <QDebug>

VideoCapture::VideoCapture(QObject *parent)
    : QThread { parent }
    , mVideoCap{ID_CAMERA}
{
    file_path = QFileDialog::getSaveFileName(NULL, tr("Choose a filename to save under"), QString(), tr("TXT(*.txt);;LOG(*.log)"));
}



void VideoCapture::time_setup(double time)
{
    stopTime = time;
}

void VideoCapture::select_color(QString color)
{
    if (color == "green")
    {
        colorLeftRange = {53, 55, 147};
        colorRightRange = {83, 160, 255};
    }
    else
    {
        colorLeftRange = {94, 122, 95};
        colorRightRange = {150, 255, 255};
    }
}

void VideoCapture::run()
{
    if (mVideoCap.isOpened())
    {

        timer.start();

        while (true)
        {
            mVideoCap >> mFrame;

            cv::cvtColor(mFrame, img, cv::COLOR_BGR2HSV);

            //cv::inRange(img, cv::Scalar(94, 122, 95), cv::Scalar(150, 255, 255), mFrame);
            cv::inRange(img, colorLeftRange, colorRightRange, mFrame);

            cv::bitwise_and(img, img, result, mFrame);

            cv::cvtColor(result, result, cv::COLOR_HSV2BGR);

            cv::Moments moment = cv::moments(mFrame, 1);
            /*
             безсмысленное присваивание переменных переменным в цикле
            dM01 = moment.m01;

            dM10 = moment.m10;

            dArea = moment.m00;
            */

            if (moment.m00 > 150)
            {

                x = moment.m10 / moment.m00;

                y = moment.m01 / moment.m00;

                recTime = (double) timer.elapsed() * 0.001;

                // 0.179 коэффициент для перевода из пикселей в миллиметры

                //X.push_back(std::abs(x - x0) * 0.179);

                //Y.push_back(std::abs(y - y0) * 0.179);
                X.push_back(x * 0.179);

                Y.push_back(y * 0.179);

                time.push_back(recTime);

                x0 = x;

                y0 = y;
            }

            if(recTime >= stopTime)
            {
                qDebug() << "exit";

                break;
            }

            if (!result.empty())
            {
                mPixmap = cvMatToQPixmap(result);

                emit newPixmapCaptured();
            }

            result = NULL;
        }

        out.open(file_path.toStdString());

        for(int i = 4; i < X.size(); i++)
        {

            out << time[i] << ',' << std::abs(X[i]-X[i-1]) << ',' << std::abs(Y[i]-Y[i-1]) << ',' << X[i] << ',' << Y[i] << std::endl;
        }

        out.close();

        qDebug()<<"ЗАКРОЙ";

        recTime = 0;

        X.clear();

        Y.clear();

        time.clear();

        emit endRecording();
    }

}

QImage  VideoCapture::cvMatToQImage( const cv::Mat &inMat )
{
    switch ( inMat.type() )
    {
    // 8-bit, 4 channel
    case CV_8UC4:
    {
        QImage image( inMat.data,
                      inMat.cols, inMat.rows,
                      static_cast<int>(inMat.step),
                      QImage::Format_ARGB32 );

        return image;
    }

        // 8-bit, 3 channel
    case CV_8UC3:
    {
        QImage image( inMat.data,
                      inMat.cols, inMat.rows,
                      static_cast<int>(inMat.step),
                      QImage::Format_RGB888 );

        return image.rgbSwapped();
    }

        // 8-bit, 1 channel
    case CV_8UC1:
    {
#if QT_VERSION >= QT_VERSION_CHECK(5, 5, 0)
        QImage image( inMat.data,
                      inMat.cols, inMat.rows,
                      static_cast<int>(inMat.step),
                      QImage::Format_Grayscale8 );
#else
        static QVector<QRgb>  sColorTable;

        // only create our color table the first time
        if ( sColorTable.isEmpty() )
        {
            sColorTable.resize( 256 );

            for ( int i = 0; i < 256; ++i )
            {
                sColorTable[i] = qRgb( i, i, i );
            }
        }

        QImage image( inMat.data,
                      inMat.cols, inMat.rows,
                      static_cast<int>(inMat.step),
                      QImage::Format_Indexed8 );

        image.setColorTable( sColorTable );
#endif

        return image;
    }

    default:
        qWarning() << "ASM::cvMatToQImage() - cv::Mat image type not handled in switch:" << inMat.type();
        break;
    }

    return QImage();
}

QPixmap VideoCapture::cvMatToQPixmap( const cv::Mat &inMat )
{
    return QPixmap::fromImage( cvMatToQImage( inMat ) );
}
