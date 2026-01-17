private ["_locations","_location","_pos","_x","_y"];

_locations = nearestLocations [dtk_center, ["hill"], 5000];

if (count _locations == 0) exitWith {
	_x = [0,10250]call core_random;
	_y = [0,10250]call core_random;
	if (surfaceIsWater [_x,_y])exitWith {call s_hunting_hill};
	[_x,_y,0]
};

_location = _locations call BIS_selectRandom;
_pos = locationPosition _location;

_x = (_pos select 0) + (random 500 - 250);
_y = (_pos select 1) + (random 500 - 250);

[_x, _y, 0];
