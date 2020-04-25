import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.0                   //встроенный модуль

Item{
    width: 60
    height: 60
    property alias one_icon: one_icon.source    //свой-во для изображения


    Image {
        id: one_icon
        anchors.fill: parent
        source: "icons/2789550284.jpg"
        visible: false                          //делаем невидимым, чтобы углы картинки не были видны под маской
    }

    OpacityMask {                               //компонент для маскировки одного элемента другим
        anchors.fill: one_icon
        source: one_icon                        //в качестве элемента, который будет маскироваться, берём наше изображение
        maskSource: Rectangle {                 //элемент, который будет использоваться в качестве маски - прямоугольник
            width: one_icon.width
            height: one_icon.height
            radius: 30
            visible: false                      //должно быть невидимым, иначе покроет изображение
        }
    }

}

