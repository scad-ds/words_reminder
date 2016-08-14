import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQml.StateMachine 1.0 as DSM

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
                targetState: selectTranslationModeState
            }
        }

        DSM.State
        {
            id: selectTranslationModeState

            signal byLevelClicked()

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationModeComponent
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
                signal: selectTranslationModeState.byLevelClicked
                targetState: selectTranslationLevelState
            }
        }

        DSM.State
        {
            id: selectTranslationLevelState

            onEntered:
            {
                contentLoader.sourceComponent = selectTranslationLevelComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationModeState
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
                contentLoader.sourceComponent = selectTranslationLevelComponent
            }

            DSM.SignalTransition
            {
                signal: screensDsm.backClicked
                targetState: selectTranslationModeState
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

    Component
    {
        id: loadingScreenComponent

        LoadingScreen
        {
            id: loadingScreen
        }
    }

    Component
    {
        id: startScreenComponent

        StartScreen
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
        id: selectTranslationModeComponent

        SelectTranslationMode
        {
            id: selectTranslationMode

            onLeftHeaderButtonClicked:
            {
                screensDsm.backClicked()
            }

            onRightHeaderButtonClicked:
            {
                screensDsm.quitClicked()
            }

            onByLevelClicked:
            {
                selectTranslationModeState.byLevelClicked()
            }
        }
    }

    Component
    {
        id: selectTranslationLevelComponent

        SelectTranslationLevel
        {
            id: selectTranslationLevel

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
        id: selectTranslationDirectionComponent

        SelectTranslationDirection
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
