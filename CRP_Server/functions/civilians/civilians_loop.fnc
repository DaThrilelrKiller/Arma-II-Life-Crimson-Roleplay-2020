
private ["_vehicles","_mrk","_vehicle"];

for "_i" from 0 to 1 step 0 do {

	if (count allUnits < 120)then {
	 	[]call s_civilians_spawn;
	}else{
		if (count allUnits > 130) then {
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
				(group _vehicle) move (getMarkerPos _mrk);
        	};

			if (!alive _vehicle) exitWith {
				[_group]call groups_delete;
			};
		
			if (fuel _vehicle < 0.5)then {
				_vehicle setFuel 1;
			};
		
		}forEach _vehicles;

	}forEach (call groups_getGroups);
	sleep 0.5;
};