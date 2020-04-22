import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13

Rectangle {     //прямоугольник, в котором данные о контакте
    id: me
    property alias name_contact: name_contact.text      //свойства картинки и имени контакта
    property alias icon: icon.source
    width:parent.width
    height:60

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

}
