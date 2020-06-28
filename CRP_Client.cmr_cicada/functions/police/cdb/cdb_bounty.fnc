private ["_warrants","_return"];

_warrants = _this getVariable ["cdb_warrants",[]];
_return = 0;

{
	_return = _return + (_x select 1);
}forEach _warrants;

_return