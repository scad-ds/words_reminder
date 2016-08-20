import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQml.StateMachine 1.0 as DSM
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/Screens" as Screens

Window
{
    visible: true
    width: 480
    height: 800
    title: qsTr("Translator")

    DSM.StateMachine
    {
        id: screensDsm
        initialState: initState
        running: true

        signal backClicked()
        signal quitClicked()

        DSM.State
        {
            id: initState

            DSM.SignalTransition
            {
                signal: initState.entered
                targetState: startScreenState
            }
        }

        DSM.State
        {
            id: startScreenState

            signal startClicked()

            onEntered:
            {
                contentLoader.sourceComponent = startScreenComponent
            }

            DSM.SignalTransition
            {
                signal: startScreenState.startClicked
                targetState: selectTranslationCategoryState
            }
        }

        DSM.State
        {
            id: selectTranslationCategoryState

            signal categoryActivated(int index)
            signal toSubcategoties()

            property var categotiesModel: null

            onCategoryActivated:
            {
                selectTranslationSubcategoryState.categoryIndex = index /*From signal*/
                selectTranslationSubcategoryState.categoryName = selectTranslationCategoryState.categotiesModel.getCategoryNameByIndex(index /*From signal*/)
                selectTranslationCategoryState.toSubcategoties()
            }

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationCategoryComponent
                selectTranslationCategoryState.categotiesModel = qmlModelsFactory.createCategoriesModel(contentLoader.item)
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: startScreenState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }

            DSM.SignalTransition
            {
                signal: selectTranslationCategoryState.toSubcategoties
                targetState: selectTranslationSubcategoryState
            }
        }

        DSM.State
        {
            id: selectTranslationSubcategoryState

            property var subcategotiesModel: null
            property string categoryName: ""
            property int categoryIndex: -1

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationSubcategoryComponent
                selectTranslationSubcategoryState.subcategotiesModel = qmlModelsFactory.createSubcategoriesModel(selectTranslationSubcategoryState.categoryIndex, contentLoader.item)
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationCategoryState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: selectTranslationDirectionState

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationSubcategoryComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationCategoryState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.FinalState
        {
            id: finalState
        }
        onFinished:
        {
            Qt.quit()
        }
    }

    Loader
    {
        id: contentLoader

        anchors.fill: parent
        asynchronous: true
        sourceComponent: loadingScreenComponent
    }

    // ------------------- Models -------------------------------------------------------

    QtObject
    {
        id: qmlModelsFactory

        function createCategoriesModel(parent)
        {
            return categoriesModelComponent.createObject(parent)
        }

        function createSubcategoriesModel(index, parent)
        {
            return subcategoriesModelComponent.createObject(parent)
        }
    }

    Component
    {
        id: categoriesModelComponent

        ListModel
        {
            id: categoriesModel

            // Roles:
            // 1
            // 1
            // 1
            // 1

            function getCategoryNameByIndex(index)
            {
                return categoriesModel.get(index).name
            }

            Component.onCompleted:
            {
                categoriesModel.append({ "name": "By levels" })
                categoriesModel.append({ "name": "All verbs" })
                categoriesModel.append({ "name": "Irregular verbs 1" })
                categoriesModel.append({ "name": "Irregular verbs 2" })
                categoriesModel.append({ "name": "Irregular verbs 3" })
                categoriesModel.append({ "name": "Irregular verbs 4" })
            }
        }
    }

    Component
    {
        id: subcategoriesModelComponent

        ListModel
        {
            id: subcategoriesModel

            // Roles:
            // 1
            // 1
            // 1
            // 1

            function switchSubcategory(index)
            {
                console.debug("function switchSubcategory(index) " + index)
            }

            function createPartsModel(index)
            {
                console.debug("function createPartsModel(index) " + index)
                return 12
            }

            Component.onCompleted:
            {
                subcategoriesModel.append({ "name": "subcategoty 1" })
                subcategoriesModel.append({ "name": "subcategoty 2" })
                subcategoriesModel.append({ "name": "subcategoty 3" })
                subcategoriesModel.append({ "name": "subcategoty 4" })
            }
        }
    }

    // ------------------- Components ---------------------------------------------------

    Component
    {
        id: loadingScreenComponent

        Common.LoadingScreen
        {
            id: loadingScreen
        }
    }

    Component
    {
        id: startScreenComponent

        Screens.StartScreen
        {
            id: startScreen

            onStartClicked:
            {
                startScreenState.startClicked()
            }
        }
    }

    Component
    {
        id: selectTranslationCategoryComponent

        Screens.SelectTranslationCategoty
        {
            id: selectTranslationCategory

            categoties: selectTranslationCategoryState.categotiesModel

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }

            onCategoryActivated:
            {
                selectTranslationCategoryState.categoryActivated(index /*From signal*/)
            }
        }
    }

    Component
    {
        id: selectTranslationSubcategoryComponent

        Screens.SelectTranslationSubcategory
        {
            id: selectTranslationSubcategory

            subcategoties: selectTranslationSubcategoryState.subcategotiesModel
            categoryName: selectTranslationSubcategoryState.categoryName

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }

            onPartActivated:
            {
                console.debug(">>> categoryName = " + selectTranslationSubcategory.categoryName + ", sucategoryIndex = " + sucategoryIndex + ", partIndex = " + partIndex)

            }
        }
    }

    Component
    {
        id: selectTranslationDirectionComponent

        Screens.SelectTranslationDirection
        {
            id: selectTranslationDirection

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }
        }
    }
}
