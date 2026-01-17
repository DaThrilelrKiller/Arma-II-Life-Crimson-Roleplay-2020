/* 
	This is my version of a mission.sqm, eventaly i want to convert all objects from the mission SQM to this.
	Not only does this server side all objects but it allows us to develop our own map editor, to make future map edits more easy
	Contact Da for questions, or for a copy of the editor
*/


_config = call compile preprocessFile "\MPMissions\mission.template";

{
	_init = "";
	_object = createVehicle [(_x select 1), [0,0,0], [], 0, "CAN_COLLIDE"];
	_object setDir (_x select 3);
	_object setPosASL (_x select 2);
    _simulation = !((_x select 1)isKindOf 'Infostand_2_EP1');
	
	if (_simulation)then {
		_simulation = !((_x select 1)isKindOf "Man");
	};
	
	/*if simulation needs disabled*/
	if !(_simulation)then {
		_init = format ["%1 this enableSimulation false; this setPosASL %2; this allowDamage false; ",_init,(_x select 2)];
	};
	
	/*sets variable names*/
	if (_x select 0 != '')then {
		_init = format ["this setVehicleVarName ""%2""; %2 = this; %1",_init,(_x select 0)];
	};
	
	if (_init != "")then {
		_object setVehicleInit _init;
	};
	
	_object lock true;
	_object allowDamage false;
	
}forEach _config;

processInitCommands;
diag_log text "[LOG]Map Setup Complete!";

/*
_config = missionConfigFile >> "CRP_Mission";

for "_i" from 3 to count _config do {
	_class = _config select _i;
	_name = configName(_class);	
	systemchat _name;
};