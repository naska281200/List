import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 320
    height: 480

    title: qsTr("Контакты")
//    signal findClick()
//    onFindClick: {
//        textfind.setVisible(true)
//        if (MainToolBar.textFieldfind === "Анастасия")
//            help.setVisible(true)

//    }

    signal menuToolsClick()
    onMenuToolsClick: {             //показываем меню настроек
        menuTools.popup();
    }

    ListModel{                      //контейнер для модулей ListElement для индивидуальных значений эл-ов
        id: contactsModel
        ListElement{                //один эл-т списка
            name:"Новый контакт"
            line2:""
            pictures: "icons/Контакт.jpg"
        }
        ListElement{                //один эл-т списка
            name:"Анастасия"
            line2:"На связи"
            pictures: "icons/Анастасия.jpg"
        }
        ListElement{
            name:"Анна"
            line2:"Доступна"
            pictures: "icons/Анна.jpg"
        }
        ListElement{
            name:"Дамир"
            line2:"Всем привет!"
            pictures: "icons/Дамир.jpg"
        }
        ListElement{
            name:"Елизавета"
            line2:"Живите ярче!"
            pictures: "icons/Елизавета.jpg"
        }
        ListElement{
            name:"Надежда"
            line2:"***без статуса***"
            pictures: "icons/Надежда.jpg"
        }
    }
    ColumnLayout{
        anchors.fill: parent
        HelpBar{
            anchors.top:parent.top
        }
        MainToolBar{
            Layout.fillWidth: true
            onNewItem: {                                //обработчик сигнала
                contactsModel.append({name:new_name})   //добавление в ListView
            }
        }
        ContactList{
            id:list
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: contactsModel                //подключаем контейнер в котором находятся различные эл-ты
            onMenu: {                           //обработчик сигнала menu()
                contactListMenu.popup()         //открывает меню в указанной позиции x, y координат относительно его родительского элемента
                //по умолчанию выпадает, где курсор мыши
            }
        }
    }

    Menu{                               //контекстное меню
        id: contactListMenu
        modal: true                     //свойство определяет, является ли всплывающее окно главным(true)
        MenuItem{                       //элемент для добавления в меню
            text: "Удалить"
            onTriggered: {              //срабатывание, когда активирован пункт меню
                contactsModel.remove(list.menuIndex)    //удаляем нажатый эл-т
            }
        }
    }
    Menu{                               //контекстное меню
        id: menuTools
        modal: true                     //свойство определяет, является ли всплывающее окно главным(true)
        MenuItem{                       //элемент для добавления в меню
            text: "Пригласить друга"
        }
        MenuItem{                       //элемент для добавления в меню
            text: "Контакты"
        }
        MenuItem{                       //элемент для добавления в меню
            text: "Обновить"
        }
        MenuItem{                       //элемент для добавления в меню
            text: "Помощь"
            onTriggered: {              //срабатывание, когда активирован пункт меню
                help.setVisible(true)
            }
        }
    }
    MessageDialog{
        id: help
        title:"Помощь с контактами"
        text: "Если кто-то из Ваших друзей не отображается в списке контактов, мы рекомендуем следующее:\n\n Убедитесь, что номер телефона Вашего друга сохранён в адресной книге\n Убедитесь, что Ваш друг использует WhatsApp Messenger"
    }
//    MessageDialog{
//        id: textfind
//        title:"Помощь с контактами"
//        text:MainToolBar.textFieldfind
//    }

}
