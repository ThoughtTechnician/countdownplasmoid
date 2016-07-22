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

    property string cfg_eventDate
    property var eventMoment: new Date(cfg_eventDate)
    property alias cfg_eventTitle: titleField.text

    Component.onCompleted: {
    	//console.log("hrsChooser.value: " + hrsChooser.value);
    	//console.log("minsChooser.value: " + minsChooser.value);
    	//console.log("secsChooser.value: " + secsChooser.value);
	//console.log("titleField.text: " + titleField.text);
	//console.log("----------------------------");
	//console.log("eventMoment: " + eventMoment);
    }

    function doThing(someDate, someValue) {
	
	someDate.setHours(someValue);

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
	    selectedDate: eventMoment
	    onClicked: {
		    eventMoment.setFullYear(date.getFullYear());
		    eventMoment.setMonth(date.getMonth());
		    eventMoment.setDate(date.getDate());
		    cfg_eventDate = eventMoment.toJSON();
	    }
       }
       RowLayout {
	       
	       SpinBox {
			id: hrsChooser
			maximumValue: 23
			value: eventMoment.getHours()
	  	        onEditingFinished: {
				eventMoment.setHours(value);
				cfg_eventDate = eventMoment.toJSON();
	      		}

		}
		Text {
			text: ":"
		}
	       SpinBox {
			id: minsChooser
			maximumValue: 60
			value: eventMoment.getMinutes()
	  	        onEditingFinished: {
				eventMoment.setMinutes(value);
				cfg_eventDate = eventMoment.toJSON();
	      		}
		}
		Text {
			text: ":"
		}

	       SpinBox {
			id: secsChooser
			maximumValue: 60
			value: eventMoment.getSeconds() 
	  	        onEditingFinished: {
				eventMoment.setSeconds(value);
				cfg_eventDate = eventMoment.toJSON();
	      		}
		}

       }
       Button {
		id: testButton
		text: "TestButton"
		width: 30
		onClicked: {
			console.log("selectedDate: " + dateChooser.selectedDate);
    			console.log("eventMoment: " + eventMoment);
		}
	}
       TextField {
            id: origField 
    	}
    }
}
