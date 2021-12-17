#include "qmlplot.h"
#include "qcustomplot.h"
#include <QDebug>
#include <QFile>

CustomPlotItem::CustomPlotItem( QQuickItem* parent ) : QQuickPaintedItem( parent )
    , m_CustomPlot( nullptr )
{
    setFlag( QQuickItem::ItemHasContents, true );

    setAcceptedMouseButtons( Qt::AllButtons );

    connect( this, &QQuickPaintedItem::widthChanged, this, &CustomPlotItem::updateCustomPlotSize );

    connect( this, &QQuickPaintedItem::heightChanged, this, &CustomPlotItem::updateCustomPlotSize );

    file_path = QFileDialog::getOpenFileName(NULL, tr("Choose a filename to save under"), QString(), tr("TXT(*.txt);;LOG(*.log)"));
    QFile file(file_path);
          if(file.open(QIODevice::ReadOnly |QIODevice::Text))
          {
              while(!file.atEnd())
              {
                  QString str = file.readLine();
                  QStringList lst = str.split(",");

                  time.push_back(lst.at(0).toDouble());
                  X.push_back(lst.at(1).toDouble());
                  Y.push_back(lst.at(2).toDouble());
              }
          }

}

CustomPlotItem::~CustomPlotItem()
{
    delete m_CustomPlot;

    m_CustomPlot = nullptr;


}

void CustomPlotItem::initCustomPlot()
{
    m_CustomPlot = new QCustomPlot();

    updateCustomPlotSize();

    m_CustomPlot->addGraph();

    m_CustomPlot->graph( 0 )->setPen( QPen( Qt::red ) );

    m_CustomPlot->xAxis->setLabel( "Время, с" );

    m_CustomPlot->yAxis->setLabel( "Значение ошибки, мм" );

    m_CustomPlot->xAxis->setRange( 0, 16 );

    m_CustomPlot->yAxis->setRange( 0, 3 );

    m_CustomPlot ->setInteractions( QCP::iRangeDrag | QCP::iRangeZoom );



    connect( m_CustomPlot, &QCustomPlot::afterReplot, this, &CustomPlotItem::onCustomReplot );

    m_CustomPlot->replot();

    m_CustomPlot->addGraph();
    m_CustomPlot->graph(0)->addData(time,X);
    m_CustomPlot->graph(0)->setPen(QPen("red"));
    m_CustomPlot->addGraph();
    m_CustomPlot->graph(1)->addData(time,Y);
    m_CustomPlot->graph(1)->setPen(QPen("blue"));

    time.clear();
    X.clear();
    Y.clear();
}


void CustomPlotItem::paint( QPainter* painter )
{
    if (m_CustomPlot)
    {
        QPixmap picture( boundingRect().size().toSize() );

        QCPPainter qcpPainter( &picture );

        m_CustomPlot->toPainter( &qcpPainter );

        painter->drawPixmap( QPoint(), picture );
    }
}

void CustomPlotItem::mousePressEvent( QMouseEvent* event )
{
    qDebug() << Q_FUNC_INFO;

    routeMouseEvents( event );
}

void CustomPlotItem::mouseReleaseEvent( QMouseEvent* event )
{
    qDebug() << Q_FUNC_INFO;
    routeMouseEvents( event );
}

void CustomPlotItem::mouseMoveEvent( QMouseEvent* event )
{
    routeMouseEvents( event );
}

void CustomPlotItem::mouseDoubleClickEvent( QMouseEvent* event )
{
    qDebug() << Q_FUNC_INFO;
    routeMouseEvents( event );
}

void CustomPlotItem::wheelEvent( QWheelEvent *event )
{
    routeWheelEvents( event );
}


void CustomPlotItem::graphClicked( QCPAbstractPlottable* plottable )
{
    qDebug() << Q_FUNC_INFO << QString( "Clicked on graph '%1 " ).arg( plottable->name() );
}

void CustomPlotItem::routeMouseEvents( QMouseEvent* event )
{
    if (m_CustomPlot)
    {
        QMouseEvent* newEvent = new QMouseEvent( event->type(), event->localPos(), event->button(), event->buttons(), event->modifiers() );

        QCoreApplication::postEvent( m_CustomPlot, newEvent );
    }
}

void CustomPlotItem::routeWheelEvents( QWheelEvent* event )
{
    if (m_CustomPlot)
    {
        QWheelEvent* newEvent = new QWheelEvent( event->pos(), event->delta(), event->buttons(), event->modifiers(), event->orientation() );

        QCoreApplication::postEvent( m_CustomPlot, newEvent );
    }
}

void CustomPlotItem::updateCustomPlotSize()
{
    if (m_CustomPlot)
    {
        m_CustomPlot->setGeometry(0, 0, (int)width(), (int)height());

        m_CustomPlot->setViewport(QRect(0, 0, (int)width(), (int)height()));
    }
}

void CustomPlotItem::onCustomReplot()
{
    qDebug() << Q_FUNC_INFO;

    update();
}
