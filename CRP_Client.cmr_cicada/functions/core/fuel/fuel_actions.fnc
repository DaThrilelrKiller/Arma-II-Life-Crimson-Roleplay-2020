if (dtk_server)exitWith {};

private ["_fuelStations"];
_fuelStations = nearestobjects [dtk_center, ["MAP_A_FuelStation_Feed","Land_A_Fuelstation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_benzina_schnell","Land_fuelstation_army"], dtk_center select 0];

{
	_x setVehicleVarName format ["fuel_%1",_forEachIndex];
	missionNamespace setVariable [format ["fuel_%1",_forEachIndex],_x];
	// If pump is linked to a player-owned station, it will have `fuel_stock` set by the server.
	// `fuel_stock == -1` means legacy/unlimited pump.
	_x addaction ["","noscript.sqf",'call fuel_fill;',25,false,true,"LeanRight","player distance _target < 5 && {!([_target,'Pump Fuel (E)','data\images\tags\Gas pump']call tag_show)} && {(_target getVariable ['fuel_stock',-1]) != 0}"];
}forEach _fuelStations;