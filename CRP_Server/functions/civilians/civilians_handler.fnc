private ["_towns","_civs","_vehicle","_unit","_town"];

hello_civs = _this select 0;

while {true} do {

    {
		_vehicle = _x select 0;
		_unit = _x select 1;
	
        if (alive _vehicle && {speed _vehicle < 3}) then {
			_town = dtk_houses call BIS_selectRandom;
            (group _unit) move (getMarkerPos _town);
        };
		
		if (!alive _vehicle || {!alive _unit}) then {
			deleteVehicle _vehicle;
			deleteVehicle _unit;
			_return = []call s_civilians_respawn;
			hello_civs set[_forEachIndex,_return];
		};
		
		if (fuel _vehicle < 0.5)then {
			_vehicle setFuel 1;
		};
		
		
		sleep 0.5;
    } forEach hello_civs;
	sleep 10;
};
