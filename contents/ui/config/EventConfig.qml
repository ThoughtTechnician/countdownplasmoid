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

    property alias cfg_eventHours: hrsChooser.value
    property alias cfg_eventMinutes: minsChooser.value
    property alias cfg_eventSeconds: secsChooser.value
    property alias cfg_eventTitle: titleField.text

    Component.onCompleted: {
    	console.log("hrsChooser.value: " + hrsChooser.value)
    	console.log("minsChooser.value: " + minsChooser.value)
    	console.log("secsChooser.value: " + secsChooser.value)
    	console.log("titleField.text: " + titleField.text)
    }

    ColumnLayout {
   	Text {
            text: i18n("Title")
        }
        TextField {
            id: titleField 
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
		Text {
			text: " "
		}
		SpinBox {
			id: tzChooser

		}

       }
       Button {
		id: testButton
		text: "TestButton"
		width: 30
		onClicked: {
			console.log("putting value into myDate");
			console.log("1: cfg_eventMoment: " + cfg_eventMoment);
			//cfg_eventMoment = new Date(Number(plasmoid.configuration.eventMoment));
			console.log("2: cfg_eventMoment: " + cfg_eventMoment);
		}
	}
       TextField {
            id: origField 
    	}
       TextField {
            id: actualField 
       }
    }
}
