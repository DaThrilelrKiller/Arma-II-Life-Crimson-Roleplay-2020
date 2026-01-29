private ["_unit","_return"];

_unit = _this select 0;

_return = {
	if (_x call TFAR_fnc_isRadio || {_x == "ItemRadio"})exitWith {true};
	false
}forEach (weapons player);

_return