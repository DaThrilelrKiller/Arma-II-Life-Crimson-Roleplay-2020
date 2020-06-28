private["_player", "_vehicle", "_slot_id"];
_player = _this select 0;
_vehicle = _this select 1;
_slot_id = _this select 2;

private["_class", "_slot_entry"];

_class = typeOf _vehicle;

_slot_entry = [_class, _slot_id] call mounted_lookup_class_slot;
if ((typeName _slot_entry) != "ARRAY") exitwith {};

private["_offset", "_heading", "_blocked_actions", "_blocked_keys", "_default_action", "_direction_min", "_direction_max"];
_offset = ((_slot_entry select mounted_slot_offset) select mounted_slot_offset_data);
_heading = ((_slot_entry select mounted_slot_heading) select mounted_slot_heading_data);
_blocked_actions = (_slot_entry select mounted_slot_blocked_actions);
_blocked_keys = [_blocked_actions] call mounted_keysForActions;
_default_action = _slot_entry select mounted_slot_default_action;
_direction_min = _slot_entry select mounted_slot_direction_min;
_direction_max = _slot_entry select mounted_slot_direction_max;

[_player, _vehicle, _offset] call mounted_attach;
[_player, _heading] call mounted_set_heading;
_player playActionNow _default_action;
_player groupChat format["You have boarded a mounted slot in this vehicle. Use Control + E to exit"];

if (_vehicle isKindOf "helicopter") then {
if (({_vehicle isKindOf _x} count A_R_vehicles) > 0) then {
_player groupChat format["This slot can be rappeled from, Use Shift + E to rappel if rope is deployed."];
};
};


_player setVariable ["inMountedSlot", true, true];
_player setVariable ["mountedVehicle", _vehicle, true];
[_vehicle, _slot_id, _player] call mounted_set_slot_occupant;

titleText ["", "BLACK OUT", 0.1];
[_player, _vehicle, _slot_id, _blocked_keys] call mounted_setup_keyDown;
[_player, _vehicle, _slot_id, _blocked_keys] call mounted_setup_keyUp;
[_player, _vehicle, _slot_id, _direction_min, _direction_max] call mounted_setup_mouseMoving;
[_player, _vehicle, _slot_id] call mounted_slot_wait;
titleText ["", "BLACK IN", 2];