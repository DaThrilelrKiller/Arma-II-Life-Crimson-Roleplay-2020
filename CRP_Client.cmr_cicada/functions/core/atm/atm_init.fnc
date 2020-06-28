if (dtk_server)exitWith {};

{
	_x addaction ["","noscript.sqf","call atm_open;", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'ATM (E)','\crp_data\images\misc\bank']call tag_show)}"];
}ForEach (nearestobjects [dtk_center, ["tcg_atm"], (dtk_center select 0)]);


mainbank addaction ["","noscript.sqf","call atm_open;", 25, false, true, "LeanRight","player distance _target < 5 && {!([_target,'ATM (E)','\crp_data\images\misc\bank']call tag_show)}"];

call atm_markers;