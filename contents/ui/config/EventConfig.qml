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

    property int cfg_eventYear
    property int cfg_eventMonth
    property int cfg_eventDay
    property string cfg_eventDate //: dateChooser.selectedDate
    property var eventMoment: new Date(cfg_eventDate)//: new Date("2016-08-07T13:00:00.000Z")
    property int cfg_eventHours //: hrsChooser.value
    property int cfg_eventMinutes //: minsChooser.value
    property int cfg_eventSeconds //: secsChooser.value
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
//			console.log("putting value into myDate");
//			console.log("1: eventMoment: " + eventMoment);
			//eventMoment = new Date(Number(plasmoid.configuration.eventMoment));
//			console.log("2: eventMoment: " + eventMoment);
			//console.log("plasmoid.configuration.eventMoment: " + plasmoid.configuration.eventMoment);
			//plasmoid.configuration.eventMoment = new Date("2016-08-07T13:00:00.000Z");
			//eventMoment = new Date("2016-08-07T13:00:00.000Z");
			//console.log("plasmoid.configuration.eventMoment2: " + plasmoid.configuration.eventMoment);
			//cfg_eventYear = 3017;
			console.log("selectedDate: " + dateChooser.selectedDate);
    			console.log("eventMoment: " + eventMoment);
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
