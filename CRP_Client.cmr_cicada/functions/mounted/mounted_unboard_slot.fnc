private["_player", "_vehicle", "_slot_id"];
_player = _this select 0;
_vehicle = _this select 1;
_slot_id = _this select 2;

private["_unlocked"];
_unlocked = [_vehicle] call mounted_vehicle_unlocked;

if (not(_unlocked)) exitWith {
	player groupChat format["This vehicle is locked"];
};

_player setVariable ["inMountedSlot", false, true];
_player setVariable ["mountedVehicle", objNull, true];