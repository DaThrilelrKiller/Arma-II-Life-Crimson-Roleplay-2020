if (taxi_active)exitWith {
	systemchat "The taxi system is already in use, look at your map for pick up location";
};

taxi_active = true;
systemchat "You have started your taxi job!";

while {taxi_active} do {

	_pos = []call taxi_getLocation;
	_unit = call taxi_create;
	systemchat str local _unit;
	
	while {true} do {
		if !(taxi_active)exitWith {};
		_vehicle = vehicle player;
	
		if (_vehicle != player && {_vehicle distance _pos < 30} && {speed _vehicle < 2})exitWith {
			systemchat "Your passenger wants to get into your vehicle. Stay here and wait until he has boarded it.";
			
			if ((_vehicle emptyPositions "cargo") > 0) exitWith {
				_unit assignAsCargo _vehicle;
				[_unit] orderGetIn true;
				
				waitUntil {_unit distance _vehicle < 5};
				_unit moveInCargo _vehicle;
			};
			systemchat "There is no space in your vehicle for your passenger.";
		};
	};
		
	_pos2 = []call taxi_getLocation;
	taxi_marker setMarkerPosLocal _pos2;																																																																																				
	taxi_marker setMarkerTextLocal localize "STRS_workplacemission_taxi_marker_ziel";
		
	while {true} do {
		_vehicle = vehicle player;
		if (!alive player || {!alive _unit} || {!alive _vehicle})exitWith {};
		if !(taxi_active)exitWith {};
		
		if (_vehicle distance _pos2 < 30)exitWith {
			systemchat "Your passenger has arived at their destination!";
			_unit action ["getOut",_vehicle];
			_cash = (_pos distance _pos2) * 2;
			[player,"geld",_cash]call storage_add;
			systemchat format ["You have made %1 for being a taxi service",[_cash]call main_formatMoney];
			sleep 5;
			deleteVehicle _unit;
			deleteMarkerLocal taxi_marker;
		};
	};
};

deleteMarkerLocal taxi_marker;