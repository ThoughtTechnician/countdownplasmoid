import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.5

Item {
    id: myWindow
    
    property alias thisWindow:myWindow;
    property variant eventMoment: plasmoid.configuration.eventMoment;//new Date(2016,7,7,9,0,0,0); 
    ColumnLayout {
        id: columnLayout1
        anchors.fill: parent
        Text {
            id: countdown
            text: qsTr("0 Years 0 Days 0 Hours 0 Minutes 0 Seconds " + (plasmoid == null))
            //text: JSON.stringify(plasmoid)
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
	    function updateTime() {
    		    var now = new Date();
		    var dif = eventMoment.valueOf() - now.valueOf();
		    if (dif >= 0) {
			var secs = Math.floor(dif / 1000 % 60);
		    	var mins = Math.floor(dif / 1000 / 60 % 60);
		    	var hrs = Math.floor(dif / 1000 / 60 / 60 % 24);
		    	var days =
			    Math.floor(dif / 1000 / 60 / 60 / 24 % 365);
		    	var yrs =
			    Math.floor(dif / 1000 / 60 / 60 / 24 / 365);

			//countdown.text = savedDate;
		    	//countdown.text = plasmoid.readConfig("configtext");
			countdown.text = //eventMoment;   
			yrs + " Years " + days + " days " + hrs + " hours "
	       		    + mins + " minutes " + secs + " seconds ";

		    } else {
		    	countdown.text = "It's time!!!";
			countdown.color = "red";
		    	postCountdown.visible = false;
		    }
	    }
	    Timer {
	        interval: 100; running: true; repeat: true;
		onTriggered: countdown.updateTime() 
            }
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
