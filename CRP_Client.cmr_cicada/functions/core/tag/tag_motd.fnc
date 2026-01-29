for "_i" from 0 to 1 step 0 do {
	if (dtk_server)exitWith {
		["ALL",[],"tag_motd",false,false]call network_MPExec;
	};

	if ([75]call Main_Random)then {
		_motd = dtk_motd call bis_selectRandom;
		_motd call tag_notify;
	};
	sleep 300;
};