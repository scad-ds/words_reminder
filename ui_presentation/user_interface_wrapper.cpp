#include <ui_presentation/user_interface_wrapper.h>

namespace ui
{

UserInterfaceWrapper::UserInterfaceWrapper(QSharedPointer<um::UiModelsLayerWrapper> umWrapper)
    : uiModelsLayerWrapper_(umWrapper)
{
    QQmlComponent skinComponent(&engine_, QUrl(QStringLiteral("qrc:/SkinConfig.qml")), &engine_);
    QObject* skin = skinComponent.create();

    engine_.rootContext()->setContextProperty("skin", skin);

    engine_.load(QUrl(QStringLiteral("qrc:/main.qml")));
}

} // namespace ui
