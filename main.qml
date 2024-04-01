import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import Backend 1.0

Item {
    width: 1920
    height: 1080
    visible: true

    Backend {
        id: backend
    }

    Image {
        width: parent.width
        height: parent.height
        id: bgImage
        source: "file://home/aren/Firefox_wallpaper.png"

    }

    MouseArea {
       acceptedButtons: Qt.LeftButton | Qt.RightButton
       anchors.fill: parent
       onClicked: {
            if(mouse.button & Qt.RightButton) {
                desktopContextMenu.x = mouse.x;
                desktopContextMenu.y = mouse.y;
                desktopContextMenu.visible = true;
            } else if(mouse.button & Qt.LeftButton) {
                if(desktopContextMenu.visible) desktopContextMenu.visible = false;
            }
        }
    }

    /*Rectangle {
        id: desktopContextMenu
        visible: false
        color: "white"
        width: 110
        height: 100

        ColumnLayout {
            spacing: 0
            anchors.bottom: parent.bottom

            Button {
                Layout.fillWidth: true
                text: "Logout"
                onClicked: {
                    desktopContextMenu.visible = false;
                    backend.logout();
                }
            }
            Button {
                Layout.fillWidth: true
                text: "About Odysseus"
                onClicked: {
                    console.log("about");
                    desktopContextMenu.visible = false;
                }
            }
        }
    }*/

    Menu {
        id: desktopContextMenu

        MenuItem {
            text: "Logout"
            onPressed: {
                backend.logout();
            }
        }

        MenuItem {
            text: "About Odysseus"
            onPressed: {
                console.log("Not implemented");
            }
        }
    }
}
