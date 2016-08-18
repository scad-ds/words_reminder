#include <application.h>

Application::Application(int& argc, char** argv)
    : QGuiApplication(argc, argv)
    , dataLayerWrapper_( new dl::DataLayerWrapper() )
    , businessLayerWrapper_( new bl::BusinessLayerWrapper(dataLayerWrapper_) )
    , uiModelsLayerWrapper_( new um::UiModelsLayerWrapper(businessLayerWrapper_) )
    , uiLayerWrapper_( new ui::UserInterfaceWrapper(uiModelsLayerWrapper_) )
{
}
