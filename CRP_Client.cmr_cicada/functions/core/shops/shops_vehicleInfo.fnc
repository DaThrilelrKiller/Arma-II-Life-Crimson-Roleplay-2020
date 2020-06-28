_class = configFile >> "CfgVehicles" >> _this;
if (isClass _class)then {
	_fuel = getNumber (_class >> "fuelCapacity");
	_fuelRate = getNumber (_class >> "fuelConsumptionRate");
	_brake = getNumber (_class >> "brakeDistance");
	_damage = getNumber (_class >> "damageResistance ");
	_aommor = getNumber (_class >> "armor");
	_seats = getNumber (_class >> "transportSoldier");
	_gear = getNumber (_class >> "weaponSlots");
	_speed = getNumber (_class >> "maxSpeed");
	_turn = getNumber (_class >> "turnCoef");

	
	lbadd [303,format ["Fuel Tank: %1",_fuel]];
	lbadd [303,format ["Fuel Rate: %1",_fuelRate]];
	lbadd [303,format ["Brake Distance: %1",_brake]];
	lbadd [303,format ["Damage Resitance: %1",_damage]];
	lbadd [303,format ["Armor: %1",_aommor]];
	lbadd [303,format ["Seats: %1",_seats]];
	lbadd [303,format ["Gear Cappacity: %1",_gear]];
	lbadd [303,format ["Speed: %1",_speed]];
	lbadd [303,format ["Turn Radius: %1",_turn]];
};