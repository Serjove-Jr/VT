import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQml 2.3

Window {
    //tamanho do Vt
    width: 800
    height: 480

    id: main
    visible: true
    title: qsTr("Hello World")
    property string colorSelected: "lightgray"

    //definição do background
    Image {
        id: backgroung
        width: sourceSize.width
        height: sourceSize.height
        source: "qrc:/Images/background.jpg"
    }
    //fim da definição do background

    //layout da barra do menu superior

    Item{
        id: topMenu
        width: parent.width
        //anchors.topMargin: parent
        height: 50
        RowLayout{
            id: topButtons
            spacing: 5
            anchors.fill: parent

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
                id: autoButtonRec
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
                id: menuButtonRec
                height: topMenu.height
                width: 75
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

    }
    //Fim da configuração dos botões e textos da barra superior
    //fim do layout da barra do menu superior

    Item{//Component listView
        id:itemListView
        anchors.top: topMenu.bottom
        width: 200; height: parent.height- topMenu.height

        //Highlight do list view
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
        }//Fim do highlight
        ListView{
            id: mListViewId
            anchors.fill: parent


            width: 200; height: parent.height- topMenu.height

            MouseArea//mouse area
            {
                anchors.fill: parent

                onClicked: setCurrentItem(mouseX,mouseY)
            }

            Component {
                id: contactsDelegate
                Rectangle {
                    id: wrapper
                    width: 200
                    height: 20
                    color: ListView.isCurrentItem ? "lightgray" : "transparent"
                    Text {
                        id: contactInfo
                        text: name
                        color: wrapper.ListView.isCurrentItem ? "black" : "white"
                    }
                }
            }

            model: PageModel {}

            delegate: contactsDelegate//Text{ text: name; color: "white" }
            focus: true


        }
    }

    Item{//Configuração do StackView
        id: itemStackView
        anchors.top: topMenu.bottom
        anchors.left: itemListView.right
        width: parent.width - itemListView.width
        height: parent.height - topMenu.heigt
        StackLayout{
            id:stackLayout
            currentIndex: 0

            PiscaLD{}
            PiscaLE{}
            SensorPinoRei{}
            PortaAberta{}
            SensorCarreta{}
            SensorTravaQR{}

        }

    }

    function setCurrentItem(x, y) {
        var index = mListViewId.indexAt(x, y)
        mListViewId.currentIndex = index
        stackLayout.currentIndex = index
    }
}//Fim da window




