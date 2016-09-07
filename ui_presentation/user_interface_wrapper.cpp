#include <ui_presentation/user_interface_wrapper.h>
#include <QQmlContext>
#include <QQmlComponent>

namespace ui
{

UserInterfaceWrapper::UserInterfaceWrapper(QSharedPointer<um::UiModelsLayerWrapper> umWrapper)
    : uiModelsLayerWrapper_(umWrapper)
{
    QQmlComponent skinComponent(&engine_, QUrl(QStringLiteral("qrc:/qml_layer/Styles/SkinConfig.qml")), &engine_);
    QObject* skin = skinComponent.create();

    engine_.rootContext()->setContextProperty("skin", skin);

    engine_.load(QUrl(QStringLiteral("qrc:/qml_layer/main.qml")));
//    engine_.load(QUrl(QStringLiteral("qrc:/qml_layer/test_main.qml")));
}

} // namespace ui
