private ["_object"];
_object = cursorTarget;

if (isNull admin_move_obj)then
{
	if (isNull _object)exitWith {
	systemchat "no object found";
	};

	if (_object in INV_ServerBuildingArray)exitWith {
	systemchat format ["%1 can not be moved",_object];
	};
	
	if !(_object in (allMissionObjects "All"))exitWith {
	systemchat format ["%1 can not be moved",_object];
	};

	if (player distance _object > 10)exitWith {
	systemchat format ["the are to far away from the following object: %1",_object];
	};
admin_move_obj = _object;
_object attachTo [player];
}
else
{
	detach admin_move_obj;
	admin_move_obj = objNull;
};
