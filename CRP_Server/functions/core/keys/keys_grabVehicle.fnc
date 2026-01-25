private ["_cursor","_array","_return"];

_vehicle = vehicle player;
_cursor = cursorTarget;
_array = nearestObjects [getPos player, ["LandVehicle", "Air", "ship"], 7];

if (_vehicle != player && {[player,_vehicle]call keys_has})exitWith {_vehicle};
if (!isNull _cursor && {[player,_cursor]call keys_has})exitWith {_cursor};

_return = 
{
	if ([player,_x]call keys_has)exitWith {_x};
}forEach _array;
_return




