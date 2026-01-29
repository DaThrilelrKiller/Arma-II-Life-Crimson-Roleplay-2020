private["_i","_car","_carsKilled","_xCar"];

for "_i" from 0 to (count bc_baitcars) do
{
	_car = bc_baitcars select _i;
	if (isNull _car) then {bc_baitcars = bc_baitcars - _car;};
};

_carsKilled = 0;

{
	_xCar = _x;
	if (player distance _xCar < 500) then
	{


         (format ["%1 setFuel (0);", _xCar]) call network_broadcast;
         (format ["%1 lock true;", _xCar]) call network_broadcast;
		_carsKilled = _carsKilled + 1;
	};
	true
} count bc_baitcars;

systemChat  format ["%1 car(s) killed", _carsKilled];