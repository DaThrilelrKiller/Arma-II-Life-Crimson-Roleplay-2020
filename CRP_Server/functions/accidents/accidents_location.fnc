_location = getPos (dtk_raods call bis_selectRandom);
_buildings  = nearestobjects [_location, ["Building","Man"], 50];

if (count _buildings > 0)exitWith {call s_accidents_location};
if (surfaceIsWater _location)exitWith {call s_accidents_location};
_location
