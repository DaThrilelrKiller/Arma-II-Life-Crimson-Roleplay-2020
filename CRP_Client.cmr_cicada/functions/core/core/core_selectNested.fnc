private ["_array","_selection"];

_array = _this select 0;
_selection = _this select 1;

if (isnil "_array")exitWith {nil};
if (isnil "_selection")exitWith {_array};
if (typeName _selection != "ARRAY")exitWith {_array};

{
	if (isnil "_array")exitWith {};
	if (typeName _array != "ARRAY")exitWith {_array = nil;};
	if (count _array <= _x)exitWith {_array = nil;};
	_array = _array select _x;
}forEAch _selection;

if (isnil "_array")exitWith {nil};
_array