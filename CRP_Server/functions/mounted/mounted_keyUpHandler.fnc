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

if (_key in mounted_diallowed_keys) exitWith {
true
};

false