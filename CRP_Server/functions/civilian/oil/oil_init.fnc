
if (dtk_client)then {
	private ["_pumps","_rigs"];
	_pumps = nearestobjects [dtk_center, ["Land_Ind_Oil_Pump_EP1","Land_Ind_Oil_Tower_EP1"], (dtk_center select 0)];
	_pumps call oil_actions;
	_pumps call oil_markers;

	// Gas extraction (raw gas) from oil rig bases
	_rigs = nearestobjects [dtk_center, ["oilrig_base"], (dtk_center select 0)];
	{
		_x addaction ["","functions\items\mine.sqf",'gas', 24, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Extract Gas (E)','data\images\tags\Gas pump']call tag_show)}"];
		_x addaction ["","scripts\itemprocess.sqf",["RawGas", "GasBarrel", 2,"DTK_License_civ_oil"], 23, false, true, "LeanRight","player distance _target < 5 && {!([_target,'Process Gas (E)','data\images\tags\Gas pump']call tag_show)}"];
		["gasrig_" + str _ForEachIndex, getPos _x, nil, nil, "colorGreen", "mil_dot", nil, "Gas Rig"] call core_createMarkerLocal;
	} forEach _rigs;
};
