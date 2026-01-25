private ["_text"];

_text = markerText _this;

{
	if (_text == format ["%1's House",name _x])exitWith {
		_x
	};
	objNull
}forEach playableUnits;