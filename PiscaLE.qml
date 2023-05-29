import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
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
        text:"Pisca LE"
    }
}
