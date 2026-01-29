private ["_return","_near"];

_return = {
	_pos = _x select 0;
	_near = nearestObjects[[_pos select 0,_pos select 1,0],["Motorcycle","car","Truck", "Ship", "LandVehicle"], 3];
	if (count _near == 0)exitWith {_x};
	""
}forEach DTK_VehicleSpots;

_return
