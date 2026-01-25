if (dtk_server)exitWith {};

// Add credit option to ATM
mainbank addaction ["Credit & Loans","noscript.sqf","call credit_open;", 24, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Credit & Loans (E)','data\images\misc\bank']call tag_show)}"];

{
	_x addaction ["Credit & Loans","noscript.sqf","call credit_open;", 24, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Credit & Loans (E)','data\images\misc\bank']call tag_show)}"];
}ForEach allMissionObjects "tcg_atm";
