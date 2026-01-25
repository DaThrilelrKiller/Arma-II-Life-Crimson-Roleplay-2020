_vehicle	= _this select 0;
_selection	= _this select 1;
_damage		= _this select 2;
_shooter	= _this select 3;
_ammo		= _this select 4;


_selections = _vehicle getVariable ["selections", []];
_gethit = _vehicle getVariable ["gethit", []];


if !(_selection in _selections) then
{
	_selections set [count _selections, _selection];
	_gethit set [count _gethit, 0];
};


_index = _selections find _selection;


_olddamage = _gethit select _index;
_damage = _olddamage + ((_this select 2) - _olddamage)* 1;
_gethit set [_index, _damage];

_vehicle setVariable ["selections",_selections,true];
_vehicle setVariable ["gethit",_gethit,true];

_damage


