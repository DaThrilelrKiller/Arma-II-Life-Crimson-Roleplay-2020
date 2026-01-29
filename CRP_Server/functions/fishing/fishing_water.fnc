private ["_xcord","_ycord"];

_xcord = [0,10250]call core_random;
_ycord = [0,10250]call core_random;

if (surfaceIsWater [_xcord,_ycord])exitWith {[_xcord,_ycord]};

call s_fishing_water;