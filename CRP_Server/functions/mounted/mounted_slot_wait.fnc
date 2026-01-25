_this spawn {
private["_player", "_vehicle", "_slot_id"];
_player = _this select 0;
_vehicle = _this select 1;
_slot_id = _this select 2;

waitUntil { !(alive _player) || !(_player getVariable "inMountedSlot")};

_player setVariable ["inMountedSlot", false, true];
_player setVariable ["mountedVehicle", objNull, true];

private["_occupant"];
_occupant = [_vehicle, _slot_id] call mounted_get_slot_occupant;
if (_occupant == _player) then {
	[_vehicle, _slot_id, nil] call mounted_set_slot_occupant;
};

[] call mounted_remove_keyDown;
[] call mounted_remove_keyUp;
[] call mounted_remove_mouseMoving;

if (alive _player) then {
	private["_class", "_slot_entry"];
	_class = typeOf _vehicle;
	_slot_entry = [_class, _slot_id] call mounted_lookup_class_slot;
	if ((typeName _slot_entry) == "ARRAY") then {
	private["_exit"];
	_exit = (_slot_entry select mounted_slot_exit) select mounted_slot_exit_data;
	[_player, _vehicle, _exit] call mounted_attach;
	};

	[_player] spawn { detach (_this select 0);};

	titleText ["", "BLACK OUT", 0.1];
	titleText ["", "BLACK IN", 2];
} 
else {
	detach _player;
	hideBody _player;
};
};