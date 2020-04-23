import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13

Rectangle {     //прямоугольник, в котором данные о контакте
    id: me

    property alias name_contact: name_contact.text      //свойства картинки и имени контакта
    property alias icon: icon.source
    property bool selected: false                       //свойство selected-выбранный, изначально ничего не выбрали=false

    width:parent.width
    height:60

    signal leftClick()             //создали свои сигналы для левой кнопки мыши и для правой
    signal rightClick()

    color: {
        if (selected)              //если нажата кнопка на контакте
            return "#4fc1e9"
        if (area.containsMouse)    //если наведён только курсор, containsMouse определяет находится ли курсор в данный момент в области MouseArea
            return "#f1f1f1"
        return "white"             //если не наведён курсор и не нажат контакт
    }

    RowLayout{
        id: rowLayout
        anchors.fill:parent
        spacing: 10
        anchors.leftMargin: 5     //отступы от края прямоугольника
        anchors.rightMargin: 5
        Image{
            id:icon
            source: "icons/2789550284.jpg"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 5       //отступ со всех сторон
        }
        Label{
            id:name_contact
            Layout.fillWidth: true  //высоту не указываем, она подстроиться под шрифт текста
            font.bold: true
            font.family: "Tahoma"
            font.pointSize: 13
        }

    }
    MouseArea{                      //невидимый компонент, осуществляющий обработку мыши
        id: area
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton     //свойство содержит кнопки мыши, на которые реагирует MouseArea
        hoverEnabled: true                                  //свойство наведения мыши, курсора (включили)
        onClicked: {                                        //свойство, которое срабатывает при нажатии кнопки мыши
            if (mouse.button === Qt.LeftButton)             //нажата левая кнопка мыши, то срабатывает сигнал leftClick()
                leftClick();
            if (mouse.button === Qt.RightButton)            //нажата правая кнопка мыши, то срабатывает сигнал rightClick()
                rightClick();
        }
    }

}
