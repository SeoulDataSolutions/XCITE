import QtQuick 2.7
import QtQuick.Layouts 1.3
import "../Theme" 1.0

Item {
    property var selected

    Connections {
        target: dashboard
        onSelectView: {
            var parts = path.split(".")

            selected = parts[0]
        }
    }

    Layout.fillWidth: true
    height: moduleMenuHeight

    z: 50

    RowLayout {
        anchors.fill: parent

        RowLayout {
            spacing: 2

            ModuleMenuButton {
                name: "xCite"
                target: "xCite.home"
                text: qsTr("XCITE")
            }

            UnfinishedModuleMenuButton {
                name: "xChange"
                target: "xChange.home"
                text: qsTr("X-CHANGE")
            }

            UnfinishedModuleMenuButton {
                name: "xChat"
                target: "xChat.home"
                text: qsTr("X-CHAT")
            }

            UnfinishedModuleMenuButton {
                name: "xVault"
                target: "xVault.TBD"
                text: qsTr("X-VAULT")
            }

            UnfinishedModuleMenuButton {
                name: "xMore"
                visible: xcite.width > 1065
                target: "tools.TBD"
                text: qsTr("MORE")
            }
        }

        SearchBox {
            placeholder: qsTr("Search...")
            anchors.right: helpButton.left
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Layout.fillWidth: true
            Layout.maximumWidth: 340
        }

        ButtonIcon {
            id: helpButton
            imageSource: "../icons/help.svg"
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            opacity: 0.4
            size: 26

            onButtonClicked: {
                selectView("browser.index")
            }
        }
    }
}
