private ["_cars","_baitcar","_baitctrls","_car","_unique"];

_cars = nearestObjects [getPos player, ["LandVehicle"], 10];
if (count _cars < 1) exitWith {systemChat "No Cars To Bait!";};

// Keep bait car list healthy (Arma 2: no `select {}` filter)
if (isNil "bc_baitcars") then { bc_baitcars = []; };
private ["_aliveCars"];
_aliveCars = [];
{
	if (!isNull _x) then { _aliveCars set [count _aliveCars, _x]; };
} forEach bc_baitcars;
bc_baitcars = _aliveCars;
_unique = [];
{
	_car = _x;
	if (!(_car in _unique)) then {
		_unique set [count _unique, _car];
	};
} forEach bc_baitcars;
bc_baitcars = _unique;

// Prefer an owned nearby vehicle (not just the first land vehicle)
_baitcar = objNull;
{
	_car = _x;
	if ([player, _car] call keys_has) exitWith { _baitcar = _car; };
} forEach _cars;

if (isNull _baitcar) exitWith {systemChat "You do not own any nearby vehicle to bait.";};
if (_baitcar in bc_baitcars) exitWith {systemChat "This vehicle is already baited.";};

// Consume the kit and ensure the player has a controller
[player, "Bait_Kit", -1] call storage_add;
_baitctrls = [player, "Bait_Ctrl"] call storage_amount;
if (_baitctrls < 1) then
{
	[player, "Bait_Ctrl", 1] call storage_add;
};

bc_baitcars set [count bc_baitcars, _baitcar];
systemChat "Bait Kit Set Up!";