private ["_data","_time","_unit"];

_data = _this getVariable ["Looking",[objNull,0]];
_unit = _data select 0;
_time = _data select 1;

if (isNull _unit || {_unit == player} && {_time < time})exitWith {
	_this setVariable ["Looking",[player,(time + 1)],true];
	false
};

true