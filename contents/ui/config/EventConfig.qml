import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.0
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.calendar 2.0 as PlasmaCalendar
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.configuration 2.0 as PlasmaConfiguration

import ".."
// import "../../code/utils.js" as Utils

Item {
    id: timePage

    property alias calendar_date: dateChooser.selectedDate

    // Component.onCompleted: {
    //     cfg_exampleBool = true
    // }


    ColumnLayout {

//        CheckBox {
//            id: exampleBool
//            text: i18n("Boolean")
//        }
//        SpinBox {
//            id: exampleInt
//            suffix: i18n(" units")
//     	  }
   	Text {
            text: i18n("Title")
        }
        TextField {
            id: titleField 
            placeholderText: i18n("Title")
       }
       Calendar {
	    id: dateChooser
       }
       RowLayout {
	       SpinBox {
			id: hrsChooser
			maximumValue: 23
		}
		Text {
			text: ":"
		}
	       SpinBox {
			id: minsChooser
			maximumValue: 60
		}
		Text {
			text: ":"
		}

	       SpinBox {
			id: secsChooser
			maximumValue: 60
	       }
       }

    }
}
