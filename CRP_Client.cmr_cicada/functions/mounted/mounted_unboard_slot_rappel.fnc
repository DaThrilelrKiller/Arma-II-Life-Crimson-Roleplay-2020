private["_player", "_vehicle", "_slot_id","_class", "_slot_entry", "_exit"];
_player = _this select 0;
_vehicle = _this select 1;
_slot_id = _this select 2;

player groupChat "Dropping...";

[_player] call mounted_unboard_slot_force;

_class = typeOf _vehicle;
_slot_entry = [_class, _slot_id] call mounted_lookup_class_slot;
_exit = (_slot_entry select mounted_slot_exit) select mounted_slot_exit_data;

waitUntil {((getPosATL _player) distance (_vehicle ModelToWorld _exit)) <= 0.1};

[0,0,0,[_vehicle, true]] spawn (compile (preprocessFileLineNumbers "Awesome\Rappel\rappel.sqf"));