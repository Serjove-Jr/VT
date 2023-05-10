import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    //tamanho do Vt
    width: 800
    height: 480

    id: main
    visible: true
    title: qsTr("Hello World")

    //definição do background
    Image {
        id: backgroung
        width: parent.width
        height: parent.height
        source: "qrc:/Images/background.jpg"
    }
    //fim da definição do background

    //layout da barra do menu superior

    Item{
        id: topMenu
        width: parent.width
        //anchors.topMargin: parent
        height: 50
        }
     //fim do layout da barra do menu superior
     //inicio da configuração dos botões etextos da barra superior
    Row{
        id: topButtons
        spacing: 5
        //anchors.topMargin: parent
        height: 50
        Item{//Texto/Logo da aplicação

            id: title
            height: topMenu.height
            width: 200
            Text {
                text: qsTr("Simulador")
                anchors.centerIn: title
                color: "White"
                font.bold: true

                font.pixelSize: 24
            }

        }
        Item{//Botão do auto incremento
            height: topMenu.height
            width: 150
            SwitchButton{
                id: autoIncrementButton
                anchors.centerIn: parent
                text: qsTr("Automático")

            }
        }

        Item{//Botão do incremento
            height: topMenu.height
            width:150
            SwitchButton{
                id: incrementButton
                anchors.centerIn: parent
                text: qsTr("Incremental")
            }
        }

        Item{//Botão do Menu
            height: topMenu.height
            width: 75
            id: menuButtonRec
            RoundButton{
                id: menuButton
                anchors.centerIn: menuButtonRec
                width: 50
                height: 25

                Text {
                    anchors.centerIn: menuButton
                    text: qsTr("Menu")
                    font.pixelSize: 10
                    color:"black"
                }
            }
        }
        Item{//Botão de reset
            height: topMenu.height
            width: 75
            id: resetButtonRec
            RoundButton{
                id: resetButton
                anchors.centerIn: resetButtonRec
                width: 50
                height: 25

                Text {
                    anchors.centerIn: resetButton
                    text: qsTr("Reset")
                    font.pixelSize: 10
                    color:"black"
                }
            }
        }
    }
    //Fim da configuração dos botões e textos da barra superior
    //Component listView
    Item{
        anchors.top: topMenu.bottom
        width: 200; height: parent.height- topMenu.height

//
        Component {
            id: highlight
            Rectangle {
                width: 200; height: 20
                color: "lightsteelblue"; radius: 5
                y: mListViewId.currentItem.y
                Behavior on y {
                    SpringAnimation {
                        spring: 3
                        damping: 0.2
                    }
                }
            }
        }
        ListView{
            anchors.fill: parent
            id: mListViewId

            width: 200; height: parent.height- topMenu.height

            model: PageModel {}
            delegate: Text{ text: name;color: "white" }
            highlight: highlight
            highlightFollowsCurrentItem: false
            focus: true


        }
    }
}



