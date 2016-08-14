#pragma once

#include <QtCore>
#include <QQmlApplicationEngine>

#include <ui_models/ui_models_layer_wrapper.h>

namespace ui
{

class UserInterfaceWrapper
{
public:
    UserInterfaceWrapper(QSharedPointer<um::UiModelsLayerWrapper> umWrapper);

private:
    QWeakPointer<um::UiModelsLayerWrapper> uiModelsLayerWrapper_;
    QQmlApplicationEngine engine_;
};

} // namespace ui
