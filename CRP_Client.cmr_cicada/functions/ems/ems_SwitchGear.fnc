
if(dtk_ems)then {
	_this addaction ["Switch To Paramedic Uniform","noscript.sqf",'["KPFS_THW_Press"] call clothing_switch;', 1, false, true, "","typeOf player != 'KPFS_THW_Press' && {EMTAdavnced_id} && {vehicle player == player}"];
	_this addaction ["Switch To Aviation Pilot Uniform","noscript.sqf",'["yup_uscg_Pilot"] call clothing_switch;', 1, false, true, "","typeOf player != 'yup_uscg_Pilot' && {EMTAdavnced_id} && {vehicle player == player}"];
	_this addaction ["Switch To Turn Out Uniform","noscript.sqf",'["a2l_firefighter1"] call clothing_switch;', 1, false, true, "","typeOf player != 'a2l_firefighter1' && {FF2_id} && {vehicle player == player}"];
	_this addaction ["Switch To Turn Out SCBA Uniform","noscript.sqf",'["a2l_firefighter"] call clothing_switch;', 1, false, true, "","typeOf player != 'a2l_firefighter' && {FF2_id} && {vehicle player == player}"];
	_this addaction ["Switch To Hazmat Red Uniform","noscript.sqf",'["hazmatRed"] call clothing_switch;', 1, false, true, "","typeOf player != 'hazmatRed' && {FF2_id} && {vehicle player == player}"];
	_this addaction ["Switch To Hazmat Yellow Uniform","noscript.sqf",'["hazmatYellow"] call clothing_switch;', 1, false, true, "","typeOf player != 'hazmatYellow' && {FF2_id} && {vehicle player == player}"];
	_this addaction ["Switch To Marshal Uniform","noscript.sqf",'["olrpg_firemarshal"] call clothing_switch;', 1, false, true, "","typeOf player != 'olrpg_firemarshal' && {FF2_id} && {vehicle player == player}"];
};