import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13

Window {
    visible: true
    width: 320
    height: 480

    title: qsTr("Контакты")

    ListModel{                      //контейнер для модулей ListElement для индивидуальных значений эл-ов
        id: contactsModel
        ListElement{                //один эл-т списка
            name:"Новый контакт"
            pictures: "icons/Контакт.jpg"
        }
        ListElement{                //один эл-т списка
            name:"Анастасия"
            pictures: "icons/Анастасия.jpg"
        }
        ListElement{
            name:"Анна"
            pictures: "icons/Анна.jpg"
        }
        ListElement{
            name:"Дамир"
            pictures: "icons/Дамир.jpg"
        }
        ListElement{
            name:"Елизавета"
            pictures: "icons/Елизавета.jpg"
        }
        ListElement{
            name:"Надежда"
            pictures: "icons/Надежда.jpg"
        }
    }

    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            anchors.top:parent.top
            spacing: 0
            Button{
                Image {
                    anchors.fill:parent
                    source: "icons/стрелка.jpg"
                }
            }
            Label{
                color: "white"
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height
                text: "Выбрать"
                font.family: "Tahoma"
                font.pointSize: 12
                background: Rectangle{      //указываем фон
                    color: "#075e56"
                }
            }
            Button{
                Image {
                    anchors.fill:parent
                    source: "icons/поиск.jpg"
                }
            }
            Button{
                Image{
                    anchors.fill:parent
                    source: "icons/настройки.jpg"
                }
            }
        }

        MainToolBar{
            Layout.fillWidth: true
            onNewItem: {                                //обработчик сигнала
                contactsModel.append({name:new_name})   //добавление в ListView
            }
        }
        ContactList{
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: contactsModel                //подключаем контейнер в котором находятся различные эл-ты
        }
    }
}
