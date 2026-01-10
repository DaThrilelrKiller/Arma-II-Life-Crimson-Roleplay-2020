
private ["_vehicles","_mrk","_vehicle"];

for "_i" from 0 to 1 step 0 do {

	if (count allUnits < 90)then {
		while {count allUnits < 90} do {
			[]call s_civilians_spawn;
		};
	}else{
		if (count allUnits > 100) then {
			[]call s_civilians_despawn;
		};
	};

	{
		_vehicles = [_x] call groups_getVehicles;
		_group = _x;
		{
			_vehicle = _x;
			if (alive _vehicle && {speed _vehicle < 3}) then {
				_mrk = dtk_houses call BIS_selectRandom;
				_group move (getMarkerPos _mrk);
				["ALL",[_group,_mrk],{systemchat str _this},false,true]call network_MPExec;
        	};

			if (!alive _vehicle) exitWith {
				[_group]call groups_delete;
			};
		
			if (fuel _vehicle < 0.5)then {
				_vehicle setFuel 1;
			};
			sleep 0.5;
		}forEach _vehicles;

	}forEach (call groups_getGroups);
	sleep 0.5;
};