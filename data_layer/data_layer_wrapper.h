#pragma once

#include <QtCore>

#include <data_layer/data_accessor.h>

namespace dl
{

class DataLayerWrapper
{
public:
    DataLayerWrapper();

private:
    QSharedPointer<DataAccessor> dataAccessor_;
};

} // namespace dl
