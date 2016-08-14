#include <business_logic/business_layer_wrapper.h>

namespace bl
{

BusinessLayerWrapper::BusinessLayerWrapper(QSharedPointer<dl::DataLayerWrapper> dlWrapper)
    : dataLayerWrapper_(dlWrapper)
{

}

} // namespace bl
