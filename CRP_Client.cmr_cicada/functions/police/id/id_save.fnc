
dtk_dob = [
	lbText [1, (lbCurSel 1)],
	lbText [2, (lbCurSel 2)],
	lbText [3, (lbCurSel 3)],
	lbText [4, (lbCurSel 4)]
];

["SERVER",[player, [ 
	["Main", "data", dtk_dob] 
] ],"S_stats_update",false,false]call network_mpexec;

player setVehicleInit format["this setFace '%1';", dtk_dob select 3];
processInitCommands;

[]call spawn_openMenu;