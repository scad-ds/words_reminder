#include <ui_presentation/user_interface_wrapper.h>

namespace ui
{

UserInterfaceWrapper::UserInterfaceWrapper(QSharedPointer<um::UiModelsLayerWrapper> umWrapper)
    : uiModelsLayerWrapper_(umWrapper)
{
    engine_.load(QUrl(QStringLiteral("qrc:/main.qml")));
}

} // namespace ui
