private ["_unit","_killer","_side","_data","_kill"];


_unit = _this select 0;
_killer = _this select 1;

if (_unit == _killer)exitWith {};

_side = _unit call core_sideNumber;

_data = _killer getVariable ["dtk_kills",[0,0,0,0,0]];
_kill = _data select _side;
_kill = _kill + 1;

_data set [_side,_kill];

_killer setVariable ["dtk_kills",_data,true];