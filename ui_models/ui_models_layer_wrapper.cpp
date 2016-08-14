#include <ui_models/ui_models_layer_wrapper.h>

namespace um
{

UiModelsLayerWrapper::UiModelsLayerWrapper(QSharedPointer<bl::BusinessLayerWrapper> blWrapper)
    : businessLayerWrapper_(blWrapper)
{

}

} // namespace um
