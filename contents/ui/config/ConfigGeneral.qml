import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.calendar 2.0 as PlasmaCalendar
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import ".."
// import "../../code/utils.js" as Utils

Item {
    id: page

    property alias cfg_exampleBool: exampleBool.checked
    property alias cfg_exampleInt: exampleInt.value
    property alias cfg_exampleString: exampleString.text
    

    // Component.onCompleted: {
    //     cfg_exampleBool = true
    // }


    ColumnLayout {

        CheckBox {
            id: exampleBool
            text: i18n("Boolean")
        }
        SpinBox {
            id: exampleInt
            suffix: i18n(" units")
    }
    Text {
                text: i18n("String")
            }
            TextField {
                // id: exampleString
                placeholderText: i18n("String")
            }

    }

    


        ColumnLayout {
            id: content
            Layout.fillWidth: true

            Text {
                text: i18n("SubHeading")
                font.bold: true
            }

            RowLayout { // Does NOT crash plasmashell on close... WHAT? *headdesk*
                Text {
                    text: i18n("String")
                }
                TextField {
                    id: exampleString
                    placeholderText: i18n("String")
                }
            }
        }
}
