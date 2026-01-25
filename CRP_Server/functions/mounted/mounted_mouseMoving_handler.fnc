
private["_data", "_this", "_player", "_vehicle", "_slot_id", "_mouse_delta", "_r_delta"];

_data = _this select 1;
_this = _this select 0;

_mouse_delta = _this select 1;
_r_delta = abs(_mouse_delta);

_player = _data select 0;

if (dialog) exitWith {};
if (lookingAround) exitWith {};

private ["_direction", "_heading", "_direction_min", "_direction_max"];

_direction_min = _data select 3;
_direction_max = _data select 4;

_heading = _player getVariable "heading";
if (isNil "_heading") then {
_heading = [(getDir _player),0,0];
_player setVariable ["heading", _heading];
};

_direction = _heading select 0;

if (_mouse_delta >= 0) then {
_direction = _direction + _r_delta;

if (_direction >= _direction_max) then {
_direction = _direction_max;
};

if (_direction > 360 ) then {
_direction = (_direction - 360);
};
_heading set[0, _direction];
_player setVariable ["heading", _heading];
[_player, _heading] call mounted_set_heading;
};

if (_mouse_delta <= 0) then {
_direction = _direction - _r_delta;

if (_direction <= _direction_min) then {
_direction = _direction_min;
};

if ( _direction < 0 ) then {
_direction = 360 + _direction;
};
_heading set [0, _direction];
_player setVariable ["heading", _heading];
[_player, _heading] call mounted_set_heading;
};
false