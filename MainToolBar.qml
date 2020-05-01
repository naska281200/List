import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13
import QtQuick.Dialogs 1.2

RowLayout {                 //эл-ты будут располагаться в строке
    signal newItem(string new_name)
    property string textFieldfind: textField.text

    TextField{
        id: textField
        Layout.fillWidth: parent
        selectByMouse: true     //свой-во для выделения текста мышью
        focus:true              //свой-во, чтобы вводить текст без нажатия на строку
    }

    function add()
    {
        newItem(textField.text);   //передаём сигналу параметры
        textField.clear();
    }

    Button{
        text: "Добавить"
        highlighted: true       //подсвечивание кнопки
        onClicked: {
            add();
        }
    }

    Keys.onReturnPressed: {     //при нажатии Return
        add();
    }
    Keys.onEnterPressed: {      //при нажатии Enter
        add();
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:300}
}
##^##*/
