private ["_locations","_location","_pos","_size","_xPos","_yPos","_areaType","_areaName","_animalVariants"];

_locations = nearestLocations [dtk_center, ["VegetationFir"], 5000];

{
	if (random 1 < 0.5) then {
		_location = _x;
		_pos = locationPosition _location;
		_xPos = (_pos select 0);
		_yPos = (_pos select 1);
		
		if (!surfaceIsWater [_xPos,_yPos]) then {
			_areaType = hunting_array call BIS_selectRandom;
			_areaName = _areaType select 0;
			_animalVariants = _areaType select 1;
			_size = hunting_sizes call BIS_selectRandom;
			hunting_spots_array set [count hunting_spots_array,[_areaName, _animalVariants, [_xPos,_yPos,0],[_size,_size]]];
		};
	};
}forEach _locations;

[60,s_hunting_loop]call core_AddLoop;