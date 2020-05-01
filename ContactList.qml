import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14

ListView{                           //прокрученный список эл-ов
    id:list

    property int menuIndex: null    //свой-во, которое хранит индекс эл-та, у которого выпало меню
    signal menu()                   //сигнал для вызова контекстного меню

    clip: true                                  //свойство, чтобы элементы не выходили за пределы ListView
    boundsBehavior: ListView.StopAtBounds       //чтобы не было подпрыгивания эл-ов
    ScrollBar.vertical: ScrollBar{width: 15}    //вертикальная полоса прокрутки
    delegate: Contact_element{                  //представителем в списке будет Contact_element
        name_contact: name
        name_contact2: line2
        icons: pictures
        selected: list.currentIndex === index   //сравниваем индекс текущего эл-та с индексом делегата
        onLeftClick: {                          //функция нажатия на левую кнопку мыши
            list.currentIndex = index           //приравниваем индекс текущего эл-та к индексу нажатого делегата
        }
//        onNewContactClick: {

//        }
        onRightClick: {
            menuIndex = index                   //делаем индекс эл-та, у которого выпало меню, равным индексу нажатого делегата
            menu()                              //вызов сигнала
        }
    }
}
