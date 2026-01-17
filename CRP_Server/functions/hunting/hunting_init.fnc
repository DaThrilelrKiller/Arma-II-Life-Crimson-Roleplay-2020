private ["_locations","_location","_pos","_size","_xPos","_yPos","_animalType"];

_locations = nearestLocations [dtk_center, ["hill"], 5000];

if (count _locations == 0) exitWith {
	[120,s_hunting_loop]call core_AddLoop;
};

{
	_animalType = _x;
	{
		if (random 1 < 0.5) then {
			_location = _x;
			_pos = locationPosition _location;
			_xPos = (_pos select 0) + (random 200 - 100);
			_yPos = (_pos select 1) + (random 200 - 100);
			
			if (!surfaceIsWater [_xPos,_yPos]) then {
				_size = hunting_sizes call BIS_selectRandom;
				hunting_spots_array set [count hunting_spots_array,[_animalType, [_xPos,_yPos,0],[_size,_size]]];
			};
		};
	}forEach _locations;
}ForEach hunting_array;

[120,s_hunting_loop]call core_AddLoop;