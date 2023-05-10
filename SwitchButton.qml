import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

SwitchDelegate {
    id: control
    text: qsTr("SwitchDelegate")

    checked: true

    contentItem: Text {
        rightPadding: control.indicator.width + control.spacing
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#f7faf7" : "#f7faf7"
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    indicator: Rectangle {
        implicitWidth: 35
        implicitHeight: 20
        x: control.width - width - control.rightPadding
        y: parent.height / 2 - height / 2
        radius: 10
        color: control.checked ? "lightgray" : "#95a196" // Cor do botão cinza acionado / transparente desacionado
        border.color: control.checked ? "#666966" : "#cccccc"  //borda do retangulo quando não selecionado

        Rectangle {
            x: control.checked ? parent.width - width : 0
            width: 20
            height: 20
            radius: 10
            color: control.down ? "#cccccc" : "#ffffff"
            border.color: control.checked ? (control.down ? "#95a196" : "#95a196") : "#999999"
        }
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        visible: control.down || control.highlighted
        color: control.down ? "transparent" : "#transparent"
    }
}
