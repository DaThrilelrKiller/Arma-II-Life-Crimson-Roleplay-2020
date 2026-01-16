[]spawn 
{
	waitUntil {time > 0};
	private ["_pos","_building"];

	{
		_pos = profileNamespace getVariable [format["%1",_x],dtk_center];
		_building = _pos nearestObject _x;
		profileNamespace setVariable [format["%1",_x],getPos _building];

		if (!isNull _building)then {
			_building setVehicleInit "hideObject this";
			_building attachTo [MapCleanObjects, [0, 0, 0]];
			_building allowDamage false;
			waitUntil {
				(_building distance MapCleanObjects == 0)
			};
			detach _building;
		}else {
			diag_log format["Remove Buildings: %1 is Null at %2",[_x, ""] call Main_format_integer,_forEachIndex];
		}
	}forEach removeBuilgings;
	
	processInitCommands;
	DTK_MapSetup = true;
};