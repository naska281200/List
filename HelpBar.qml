import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13
import QtQuick.Dialogs 1.2

RowLayout{
    id:rowtool
    height: 30
    spacing: 0
    Button{
        Image {
            anchors.fill:parent
            source: "icons/стрелка.jpg"
        }
    }
    ColumnLayout{
        Layout.fillWidth: true
        Layout.preferredHeight: rowtool.height
        spacing: 0
        Label{
            color: "white"
            Layout.fillWidth: true
            text: "Выбрать"
            font.family: "Tahoma"
            font.pointSize: 12
            background: Rectangle{      //указываем фон
                color: "#075e56"
            }
        }
        Label{
            color: "white"
            Layout.fillWidth: true
            text: list.count + " контакта(-ов)"
            font.family: "Tahoma"
            font.pointSize: 8
            background: Rectangle{      //указываем фон
                color: "#075e56"
            }

        }
    }
    Button{
        Image {
            anchors.fill:parent
            source: "icons/поиск.jpg"
        }
//        onClicked: {
//            findClick();
//        }
    }
    Button{
        Image{
            anchors.fill:parent
            source: "icons/настройки.jpg"
        }
        onClicked: {
            menuToolsClick();
        }
    }
}


