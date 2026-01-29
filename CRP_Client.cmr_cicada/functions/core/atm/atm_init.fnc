if (dtk_server)exitWith {};

{
	_x addaction ["","noscript.sqf","call atm_open;", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'ATM (E)','data\images\misc\bank']call tag_show)}"];
	[("atm_" + str _ForEachIndex),getPos _x,nil,nil,"ColorGreen","mil_box",nil,format ["ATM %1",_ForEachIndex]]call core_createMarkerLocal;
}ForEach allMissionObjects "tcg_atm";


DTK_ATM_BANK addaction ["","noscript.sqf","call atm_open;", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'ATM (E)','data\images\misc\bank']call tag_show)}"];