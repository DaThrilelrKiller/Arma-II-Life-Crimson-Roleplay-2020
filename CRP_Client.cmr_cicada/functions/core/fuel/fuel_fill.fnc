private ["_vehicle","_fuel"];

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

/* checks if there is fuel in the gass station */
if(v_fuel_cost >= v_fuel_max)exitwith{
systemChat  "Oil Import Price Is Too High, Therefore There Is No Gas!";
};

_vehicle spawn fuel_handler;