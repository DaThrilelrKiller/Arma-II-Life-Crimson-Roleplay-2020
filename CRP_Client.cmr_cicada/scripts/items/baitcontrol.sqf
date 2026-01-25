private ["_carsKilled","_xCar","_unique","_car"];

// Remove destroyed/null vehicle references
if (isNil "bc_baitcars") then { bc_baitcars = []; };
private ["_aliveCars"];
_aliveCars = [];
{
	if (!isNull _x) then { _aliveCars set [count _aliveCars, _x]; };
} forEach bc_baitcars;
bc_baitcars = _aliveCars;

// De-duplicate entries (Arma 2-safe; avoid arrayIntersect dependency)
_unique = [];
{
	_car = _x;
	if (!(_car in _unique)) then {
		_unique set [count _unique, _car];
	};
} forEach bc_baitcars;
bc_baitcars = _unique;

_carsKilled = 0;
{
	_xCar = _x;
	if (player distance _xCar < 500) then
	{
		// Execute where the vehicle is local (owner/server), avoid arbitrary string compilation
		[_xCar, [_xCar, 0], "network_setFuel", false, false] call network_MPExec;
		[_xCar, [_xCar, true], "network_lock", false, false] call network_MPExec;
		_carsKilled = _carsKilled + 1;
	};
} forEach bc_baitcars;

systemChat format ["%1 car(s) killed", _carsKilled];