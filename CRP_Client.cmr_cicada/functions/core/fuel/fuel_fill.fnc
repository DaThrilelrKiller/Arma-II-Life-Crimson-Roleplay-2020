private ["_vehicle","_fuel","_pump","_stock"];

// If called via addAction, _this is [target, caller, actionId, arguments]
_pump = if (typeName _this == "ARRAY" && {count _this > 0}) then {_this select 0} else {objNull};

_vehicle = (nearestobjects [getpos player, ["Motorcycle","car","Truck", "Ship", "LandVehicle"], 10]);
_vehicle = _vehicle select 0;

/* cehcks for vehicle to refill */
if (isNull _vehicle)exitWith {
systemChat "No vehicle found, please look at the vehicle you are trying to refill";
};

_fuel = fuel _vehicle;

/* checks if the vehicle is already full */
if (_fuel >= 0.99)exitWith {
systemChat "The vehicle is already full";
};

/* checks if there is fuel at this pump (stock-driven for player-owned stations) */
_stock = if (!isNull _pump) then {_pump getVariable ["fuel_stock",-1]} else {-1};
if (_stock == 0) exitWith { systemChat "This fuel station is out of gas."; };

[_vehicle,_pump] spawn fuel_handler;