#pragma once

#include <QGuiApplication>

#include <ui_presentation/user_interface_wrapper.h>
//#include <ui_models/ui_models_layer_wrapper.h>
//#include <business_logic/business_layer_wrapper.h>
//#include <data_layer/data_layer_wrapper.h>

//class ui::UserInterfaceWrapper;
//class um::UiModelsLayerWrapper;
//class bl::BusinessLayerWrapper;
//class dl::DataLayerWrapper;

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
