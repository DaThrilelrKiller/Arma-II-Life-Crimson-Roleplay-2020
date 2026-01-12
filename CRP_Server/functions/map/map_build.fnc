private ["_pos","_building"];

{
	_pos = profileNamespace getVariable [format["%1",_x],dtk_center];
	_building = _pos nearestObject _x;
	profileNamespace setVariable [format["%1",_x],getPos _building];
		
	_building attachTo [MapCleanObjects, [0, 0, 0]];
	_building allowDamage false;
	_building spawn {
		sleep 0.1;
		detach _this;
		_this setVehicleInit "hideObject this";
	};	
}forEach removeBuilgings;
processInitCommands;
	
DTK_MapSetup = true;