private["_data"];
_data = _this select 1;
_this = _this select 0;

private["_display", "_key", "_shift", "_control", "_alt"];
_display = _this select 0;
_key = _this select 1;
_shift = _this select 2;
_control = _this select 3;
_alt = _this select 4;

private["_player", "_vehicle", "_slot_id", "_blocked_keys"];

_player = _data select 0;
_vehicle = _data select 1;
_slot_id = _data select 2;
_blocked_keys = _data select 3;

_data = [_player, _vehicle, _slot_id];

if (_key in _blocked_keys) exitWith {
true
};

if (_key == DIK_E && _control && !_shift) then {
if (speed _vehicle > 30) exitWith {
player groupChat format["%1-%2, you cannot exit the vehicle. It's moving too fast", _player, (name _player)];
};
_data call mounted_unboard_slot;
};
if (_key == DIK_E && _shift && !_control) then {

if !(_vehicle isKindOf "helicopter") exitwith {
player groupChat format["%1-%2, you cannot rappel out of this vehicle", _player, (name _player)];
};
if (({_vehicle isKindOf _x} count A_R_vehicles) <= 0) exitwith {
player groupChat format["%1-%2, you cannot rappel out of this helicopter", _player, (name _player)];
};
if !(_vehicle getVariable [A_R_DEPLOY_V, false]) exitwith {
player groupChat format["%1-%2, you cannot rappel out of this helicopter, ropes not deployed", _player, (name _player)];
};

_data spawn mounted_unboard_slot_rappel;
};

if (_key in (actionKeys "ReloadMagazine")) then {
reload _player;
};

if (_key in mounted_passthrough_keys) exitWith {
false;
};

if (_key in mounted_diallowed_keys) exitWith {
true
};

false