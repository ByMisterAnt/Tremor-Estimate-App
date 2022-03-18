QT += core gui printsupport quick widgets quickwidgets studio3d

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        appengine.cpp \
        main.cpp \
        mainwindow.cpp \
        qcustomplot.cpp \
        qmlplot.cpp \
        videocapture.cpp

RESOURCES += qml.qrc \
    images.qrc \
    scene.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    appengine.h \
    mainwindow.h \
    qcustomplot.h \
    qmlplot.h \
    videocapture.h

FORMS += \
    mainwindow.ui

win32:RC_FILE = iconFile.rc



DISTFILES += \
    app_icon.ico \
    iconFile.rc

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../opencv/build/x64/vc15/lib/ -lopencv_world454
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../opencv/build/x64/vc15/lib/ -lopencv_world454d
else:unix: LIBS += -L$$PWD/../opencv/build/x64/vc15/lib/ -lopencv_world454

INCLUDEPATH += $$PWD/../opencv/build/include
DEPENDPATH += $$PWD/../opencv/build/include
