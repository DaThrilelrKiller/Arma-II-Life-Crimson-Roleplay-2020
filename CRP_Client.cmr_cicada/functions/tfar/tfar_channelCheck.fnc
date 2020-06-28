

waitUntil {
	if (call TFAR_fnc_getTeamSpeakChannelName != "TaskForceRadio")then {
		titleText ["YOU MUST BE IN THE TASK FORCE RADIO CHANNEL WHEN PLAYING", "BLACK", 5];
		sleep 5;
		titleText ["", "PLAIN", 0];
	};
	sleep 5;
	false
};