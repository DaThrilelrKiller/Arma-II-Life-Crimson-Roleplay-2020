if (dtk_server)exitWith {};

{
	_x addaction ["Credit & Loans","noscript.sqf","call credit_open;", 24, false, true, "LeanRight","player distance _target < 5"];
}ForEach allMissionObjects "tcg_atm";
