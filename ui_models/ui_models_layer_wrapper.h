#pragma once

#include <QtCore>
#include <business_logic/business_layer_wrapper.h>

namespace um
{

class UiModelsLayerWrapper
{
public:
    UiModelsLayerWrapper(QSharedPointer<bl::BusinessLayerWrapper> blWrapper);

private:
    QWeakPointer<bl::BusinessLayerWrapper> businessLayerWrapper_;
};

} // namespace um
