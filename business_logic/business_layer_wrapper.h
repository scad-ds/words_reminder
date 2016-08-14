#pragma once

#include <QtCore>

#include <data_layer/data_layer_wrapper.h>

namespace bl
{

class BusinessLayerWrapper
{
public:
    BusinessLayerWrapper(QSharedPointer<dl::DataLayerWrapper> dlWrapper);

private:
    QWeakPointer<dl::DataLayerWrapper> dataLayerWrapper_;
};

} // namespace bl
