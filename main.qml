import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Контакты")

    ListModel{                      //контейнер для модулей ListElement для индивидуальных значений эл-ов
        id: contactsModel
        ListElement{                //один эл-т списка
            name:"Анастасия"
        }
        ListElement{
            name:"Елизавета"
        }
        ListElement{
            name:"Владислав"
        }
    }

    ListView{                       //прокрученный список эл-ов
        anchors.fill: parent
        model: contactsModel        //подключаем контейнер в котором находятся различные эл-ты
        delegate: Contact_element{  //представителем в списке будет Contact_element
            name_contact: name
        }
    }
}
