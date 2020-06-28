private ["_return"];

_return = 0;

{
	if (isPlayer _x && {typeOf _x in _this})then {
		_return = _return + 1;
	};
}forEach playableUnits;

_return