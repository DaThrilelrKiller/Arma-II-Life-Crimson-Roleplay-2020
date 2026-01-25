private ["_data"];

createDialog "liste_1_button";
lbAdd [1, "------------------------------------------------------------------------------------------"];
lbAdd [1, "                             Leaderboard"];
lbAdd [1, "------------------------------------------------------------------------------------------"];

{
	_data = _x getvariable ["dtk_kills",[0,0,0,0,0]];
	lbAdd [1, format ["Name: %1 (%2)",name _x,_x call core_side]];
	lbAdd [1, format ["Killed Civilains: %1",_data select 0]];
	lbAdd [1, format ["Killed EMS: %1",_data select 1]];
	lbAdd [1, format ["Killed Cops: %1",_data select 3]];
	lbAdd [1, "------------------------------------------------------------------------------------------"];
}forEach playableUnits;