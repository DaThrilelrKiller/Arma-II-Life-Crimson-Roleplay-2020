private ["_return"];

_return = {
	if (_this == (_x select 2 select 0))exitWith {
	_x select 0
	};
}forEach dtk_master;

_return