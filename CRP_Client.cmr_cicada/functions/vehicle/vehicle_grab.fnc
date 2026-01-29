private ["_cursor","_array","_return","_height"];

_vehicle = vehicle player;
_cursor = cursorTarget;
_array = nearestObjects [getPos player, ["LandVehicle", "Air", "ship"], 7]select 0;
_height = (getPos player) select 2;

if (_vehicle != player )exitWith {_vehicle};
if (!isNull _cursor && {player distance _cursor < 7} && {abs((getPos _cursor select 2) - _height) < 1})exitWith {_cursor};
if (!isNil '_array' && {player distance _array < 7} && {abs((getPos _array select 2) - _height) < 1})exitWith {_array};




