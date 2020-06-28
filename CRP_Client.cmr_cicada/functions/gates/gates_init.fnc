if (dtk_server || {dtk_civ})exitWith {};

{
	_x setVehicleVarName format ["gate_%1",_forEachIndex];
	missionNamespace setVariable [format ["gate_%1",_forEachIndex],_x];
	_trig = createTrigger ["EmptyDetector", getPos _x];
	_trig setTriggerArea [5, 21, getdir _x, true];
	_trig setTriggerActivation [str playerSide, "PRESENT", true];
	_trig setTriggerStatements ["this", format["%1 animate ['innergate',1];  %1 animate ['outergate',1];",_x], format["%1 animate ['innergate',0];  %1 animate ['outergate',0];",_x]];
}ForEach (nearestobjects [dtk_center, ["armat_jailfencgate"], 5125]);