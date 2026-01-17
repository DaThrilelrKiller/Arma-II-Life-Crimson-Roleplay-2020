private ["_locations","_location","_pos","_offset"];

_locations = nearestLocations [dtk_center, ["NameMarine"], 5000];

if (count _locations == 0) exitWith {
	[5125,5125,0]
};

_location = _locations call BIS_selectRandom;
_pos = locationPosition _location;

_offset = [random 500 - 250, random 500 - 250, 0];
[_pos select 0 + (_offset select 0), _pos select 1 + (_offset select 1), 0];
