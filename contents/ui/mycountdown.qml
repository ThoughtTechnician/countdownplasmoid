import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.5

ApplicationWindow {
    id: outside
    minimumWidth: 480

    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent

        Text {
            id: countdown
            text: qsTr("0 Years 1 Days 9 Hours 37 Minutes 50 Seconds")

            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }

        Text {
            id: postCountdown
            text: qsTr("remaining.")
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }
    }

}
