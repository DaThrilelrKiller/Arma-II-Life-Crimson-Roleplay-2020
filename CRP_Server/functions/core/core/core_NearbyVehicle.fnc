private["_postion","_distance","_vehicles","_return"];

_postion = _this select 0;
_distance = _this select 1;

_vehicles = nearestObjects [_postion, ["Motorcycle","car","Truck", "Ship", "LandVehicle"], _distance];

_return = {
	if (local _x)exitWith {_x};
}forEach _vehicles;

_return