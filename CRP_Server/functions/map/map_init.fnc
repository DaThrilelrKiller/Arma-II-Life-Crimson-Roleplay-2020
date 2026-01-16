[]spawn 
{
waitUntil {time > 0};
private ["_pos","_building"];

	{
		_pos = profileNamespace getVariable [format["%1",_x],dtk_center];
		_building = _pos nearestObject _x;
		profileNamespace setVariable [format["%1",_x],getPos _building];
		
		_building attachTo [MapCleanObjects, [0, 0, 0]];
		_building allowDamage false;
		diag_log format["%1 %2 %3 %4 %5",_building,isNull _building, MapCleanObjects,(_building distance MapCleanObjects),_x];
		waitUntil {
			_building distance MapCleanObjects < 50
		};
		detach _building;
		
	}forEach removeBuilgings;
	
	DTK_MapSetup = true;
	deleteVehicle MapCleanObjects;
};