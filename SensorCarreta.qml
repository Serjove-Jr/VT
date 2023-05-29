import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    id: sensorCarreta
    width: 600
    height: 460
    Rectangle{
        id: rect
        width: 600
        height: 20
        gradient:Gradient{
            GradientStop {position: 0.0;color: "gray"}
            GradientStop {position: 1.0;color: "lightgray"}
        }
    }
    Text{
        anchors.centerIn: rect
        text:"Sensor Carreta"
    }
    Item {
        id: name
        width: 100
        height: 100
        anchors.centerIn: sensorCarreta
        anchors.bottomMargin: sliderRec.top
        TextInput{
            font.bold: true
            color: "white"
            font.pixelSize: 24
            text: slider.value.toFixed(2)
        }
    }
    Item{
        id:sliderRec
        width: 100
        height: 100
        anchors.centerIn: sensorCarreta
        anchors.top: rect.Bottom

        Slider{
            id: slider
            anchors.centerIn: parent
            //anchors.horizontalCenter: sensorCarreta.width
            from: 1
            value: 25
            to: 100

        }
    }
}

