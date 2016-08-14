#pragma once

#include <QGuiApplication>

#include <ui_presentation/user_interface_wrapper.h>

class Application : public QGuiApplication
{
    Q_OBJECT
public:
    Application(int& argc, char** argv);

private:
    QSharedPointer<dl::DataLayerWrapper> dataLayerWrapper_;
    QSharedPointer<bl::BusinessLayerWrapper> businessLayerWrapper_;
    QSharedPointer<um::UiModelsLayerWrapper> uiModelsLayerWrapper_;
    QSharedPointer<ui::UserInterfaceWrapper> uiLayerWrapper_;
};
