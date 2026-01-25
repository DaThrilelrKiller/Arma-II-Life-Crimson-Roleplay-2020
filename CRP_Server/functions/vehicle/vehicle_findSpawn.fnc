private ["_kind","_roads","_logic","_return"];

_kind = [player,10]call stats_nearSave;

if (_kind == "Land")exitWith {
	_roads = (getPos player) nearRoads 10;
	_return = if (count _roads != 0)exitWith {_roads select 0};
	_logic = nearestobjects [getPos player, ["Logic"],50];
	_return = if (count _logic != 0)exitWith {_logic select 0};
};

if (_kind == "Boat")exitWith {
	_logic = nearestobjects [getPos player, ["Land_Nav_Boathouse"],10];
	_return = if (count _logic != 0)exitWith {_logic select 0};
};
if (_kind == "Helicopter")exitWith {
	_logic = nearestobjects [getPos player, ["bry_helipad"],10];
	_return = if (count _logic != 0)exitWith {_logic select 0};
};
if (_kind == "Plane")exitWith {
	_logic = nearestobjects [getPos player, ["Land_SS_hangar"],10];
	_return = if (count _logic != 0)exitWith {_logic select 0};
};

_return