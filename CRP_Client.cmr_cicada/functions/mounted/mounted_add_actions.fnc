private["_vehicle"];
_vehicle = _this select 0;
if (isNil "_vehicle") exitWith {};
private["_class"];
_class =  typeOf _vehicle;

private["_entry"];
_entry = [_class] call mounted_lookup_class;
if ((typeName _entry) != "ARRAY") exitwith {};

private ["_has_mounted_actions"];
private["_actions_variable"];
_actions_variable = format["has_mounted_actions_%1", (getPlayerUID player)]; 

_has_mounted_actions = _vehicle getVariable _actions_variable;
if (isNil "_has_mounted_actions") then { _has_mounted_actions = false;}; 
if (_has_mounted_actions) exitWith {};

private["_display_name"];
_display_name =  getText (configFile >> "CfgVehicles" >> _class >> "displayName");

private["_slots"];

_slots = _entry select mounted_slots;

{
private["_slot_id", "_slot_name", "_slot"];
_slot = _x;
_slot_id = _slot select mounted_slot_id;
_slot_name = _slot select mounted_slot_text;
_vehicle addAction [format['<t color="#dddd00">Get in %1%2</t>', _display_name, _slot_name], "noscript.sqf", format['[_this select 1, _this select 0, "%1"] call mounted_board_slot;', _slot_id], 1, false, true,"", format['([_target] call mounted_vehicle_unlocked) && ([_target, "%1"] call mounted_slot_open) && !([_this, _target] call mounted_player_inside)', _slot_id]];
} foreach _slots;


_has_mounted_actions = true;
_vehicle setVariable [_actions_variable, _has_mounted_actions];