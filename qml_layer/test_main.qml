import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQml.StateMachine 1.0 as DSM
import "qrc:/qml_layer/Common" as Common
import "qrc:/qml_layer/Screens" as Screens

Window
{
    visible: true
    width: 800
    height: 600
    title: qsTr("Test")

    SwipeView {
        id: view

        currentIndex: 1
        anchors.fill: parent

        Repeater
        {
            model: 10
            delegate:
            Rectangle {
                id: dlg
                width: 100
                height: 100
                color: index % 2 === 0 ? "blue" : "green"
            }
        }

//        Rectangle {
//            id: firstPage
//            width: 100
//            height: 100
//            color: "blue"
//        }
//        Rectangle {
//            id: secondPage
//            width: 100
//            height: 100
//            color: "red"
//        }
//        Rectangle {
//            id: thirdPage
//            width: 100
//            height: 100
//            color: "green"
//        }
    }

//    Loader
//    {
//        id: contentLoader

//        anchors.fill: parent
//        asynchronous: false
//        sourceComponent: loadingScreenComponent
//    }



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
