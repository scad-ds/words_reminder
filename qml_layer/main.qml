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
                targetState: selectCategoryState
            }
        }

        DSM.State
        {
            id: selectCategoryState

            signal categoryActivated(int index)
            signal toSubcategoties()

            property var categotiesModel: null

            onCategoryActivated:
            {
                selectSubcategoryState.categoryIndex = index /*From signal*/
                selectSubcategoryState.categoryName = selectCategoryState.categotiesModel.getCategoryNameByIndex(index /*From signal*/)
                selectCategoryState.toSubcategoties()
            }

            onEntered:
            {
                contentLoader.sourceComponent = selectCategoryComponent
                selectCategoryState.categotiesModel = qmlModelsFactory.createCategoriesModel(contentLoader.item)
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
                signal: selectCategoryState.toSubcategoties
                targetState: selectSubcategoryState
            }
        }

        DSM.State
        {
            id: selectSubcategoryState

            signal toSelectDirection()
            signal partActivated(string name, int sucategoryIndex, int partIndex)

            property var subcategotiesModel: null
            property string categoryName: ""
            property int categoryIndex: -1

            onEntered:
            {
                contentLoader.sourceComponent = selectSubcategoryComponent
                selectSubcategoryState.subcategotiesModel = qmlModelsFactory.createSubcategoriesModel(selectSubcategoryState.categoryIndex, contentLoader.item)
            }

            onPartActivated:
            {
                console.debug(">>> categoryName = " + name + ", sucategoryIndex = " + sucategoryIndex + ", partIndex = " + partIndex)
                selectSubcategoryState.toSelectDirection()
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectCategoryState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }

            DSM.SignalTransition
            {
                signal: selectSubcategoryState.toSelectDirection
                targetState: selectDirectionState
            }
        }

        DSM.State
        {
            id: selectDirectionState

            signal toCardScreen()
            signal toSelectTypeScreen()

            onEntered:
            {
                contentLoader.sourceComponent = selectDirectionComponent
            }

            DSM.SignalTransition
            {
                signal: selectDirectionState.toCardScreen
                targetState: translationCardState
            }

            DSM.SignalTransition
            {
                signal: selectDirectionState.toSelectTypeScreen
                targetState: selectTranslationTypeState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectSubcategoryState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: translationCardState

            onEntered:
            {
                contentLoader.sourceComponent = translationCardScreenComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectDirectionState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: selectTranslationTypeState

            signal toExpressTranslationScreen()
            signal toSelectFromVariantsScreen()
            signal toMakeFromLettersScreen()

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationTypeComponent
            }

            DSM.SignalTransition
            {
                signal: selectTranslationTypeState.toExpressTranslationScreen
                targetState: expressTranslationState
            }

            DSM.SignalTransition
            {
                signal: selectTranslationTypeState.toSelectFromVariantsScreen
                targetState: checkingWithVariantsState
            }

            DSM.SignalTransition
            {
                signal: selectTranslationTypeState.toMakeFromLettersScreen
                targetState: checkingWithLettersState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectDirectionState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: expressTranslationState

            onEntered:
            {
                contentLoader.sourceComponent = checkingExpressScreenComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationTypeState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: checkingWithVariantsState

            onEntered:
            {
                contentLoader.sourceComponent = checkingWithVariantsScreenComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationTypeState
            }

            DSM.SignalTransition
            {
                signal: screensDsm.quitClicked
                targetState: finalState
            }
        }

        DSM.State
        {
            id: checkingWithLettersState

            onEntered:
            {
                contentLoader.sourceComponent = checkingWithLettersScreenComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationTypeState
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
        asynchronous: false
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

            function createPartsModel(index)
            {
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
        id: selectCategoryComponent

        Screens.SelectTranslationCategoty
        {
            id: selectCategory

            categoties: selectCategoryState.categotiesModel

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
                selectCategoryState.categoryActivated(index /*From signal*/)
            }
        }
    }

    Component
    {
        id: selectSubcategoryComponent

        Screens.SelectTranslationSubcategory
        {
            id: selectSubcategory

            subcategoties: selectSubcategoryState.subcategotiesModel
            categoryName: selectSubcategoryState.categoryName

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
                selectSubcategoryState.partActivated(selectSubcategory.categoryName, sucategoryIndex, partIndex)
            }
        }
    }

    Component
    {
        id: selectDirectionComponent

        Screens.SelectTranslationDirection
        {
            id: selectDirection

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }

            onLearnSelected:
            {
                selectDirectionState.toCardScreen()
            }

            onRusToEngSelected:
            {
                selectDirectionState.toSelectTypeScreen()
            }

            onEngToRusSelected:
            {
                selectDirectionState.toSelectTypeScreen()
            }

            onMixingSelected:
            {
                selectDirectionState.toSelectTypeScreen()
            }
        }
    }

    Component
    {
        id: translationCardScreenComponent

        Screens.TranslationCardScreen
        {
            id: translationCardScreen

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

    Component
    {
        id: checkingWithVariantsScreenComponent

        Screens.CheckingTranslationWithVariants
        {
            id: checkingWithVariantsScreen

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

    Component
    {
        id: checkingWithLettersScreenComponent

        Screens.CheckingTranslationWithLetters
        {
            id: checkingWithLettersScreen

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

    Component
    {
        id: checkingExpressScreenComponent

        Screens.CheckingTranslationExpress
        {
            id: checkingExpressScreen

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

    Component
    {
        id: selectTranslationTypeComponent

        Screens.SelectTranslationType
        {
            id: selectTranslationType

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }

            onExpressTranslationActivated:
            {
                selectTranslationTypeState.toExpressTranslationScreen()
            }

            onSelectVariantsActivated:
            {
                selectTranslationTypeState.toSelectFromVariantsScreen()
            }

            onMakeLettersActivated:
            {
                selectTranslationTypeState.toMakeFromLettersScreen()
            }
        }
    }
}
