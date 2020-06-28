private ["_return","_object","_distance"];

_object = _this select 0;
_distance = _this select 1;

_return = {
	if (getMarkerPos _x distance getPos _object < _distance)exitWith {"Land"};
}forEach DTK_Land_Saves;

if (!isNil "_return")exitWith {_return};

_return = {
	if (getMarkerPos _x distance getPos _object < _distance)exitWith {"Plane"};
}forEach DTK_Plane_Saves;

if (!isNil "_return")exitWith {_return};

_return = {
	if (getMarkerPos _x distance getPos _object < _distance)exitWith {"Helicopter"};
}forEach DTK_Heli_Saves;

if (!isNil "_return")exitWith {_return};

_return = {
	if (getMarkerPos _x distance getPos _object < _distance)exitWith {"Boat"};
	""
}forEach DTK_Boat_Saves;

_return