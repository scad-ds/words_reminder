TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    business_logic/translation_manager.cpp \
    data_layer/data_accessor.cpp \
    ui_models/words_model.cpp \
    application.cpp \
    ui_presentation/user_interface_wrapper.cpp \
    business_logic/business_layer_wrapper.cpp \
    data_layer/data_layer_wrapper.cpp \
    ui_models/ui_models_layer_wrapper.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    business_logic/translation_manager.h \
    data_layer/data_accessor.h \
    ui_models/words_model.h \
    application.h \
    ui_presentation/user_interface_wrapper.h \
    business_logic/business_layer_wrapper.h \
    data_layer/data_layer_wrapper.h \
    ui_models/ui_models_layer_wrapper.h
