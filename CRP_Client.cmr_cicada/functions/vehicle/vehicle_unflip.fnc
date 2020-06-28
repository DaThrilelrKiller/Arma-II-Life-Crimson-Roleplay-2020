_vehicle = call keys_grabVehicle;
_name = _vehicle call vehicle_name;

if !(isNil "_vehicle")then {
systemChat  format["You are rolling over (%1) stay within 10m",_name];	
	
	for "_i" from 1 to 100 step 1 do {
		[format['%1%2 Un fliping',_i,"%"],'',true]call tag_notify;
		uiSleep 0.01;
		if(!alive player)exitWith {};
	};

	if (player distance _vehicle < 10)then {
		_pos = getPos _vehicle;
		_vehicle setvectorup [0,0,1];
		_vehicle setPos [_pos select 0,_pos select 1,0];
	}else
	{
		systemChat format ["You have moved to far away from %1",_vehicle];
	};
};