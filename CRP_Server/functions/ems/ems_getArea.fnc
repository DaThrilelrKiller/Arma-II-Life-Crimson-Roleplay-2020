private ["_building","_postions","_location"];

_building = (dtk_buildings call bis_selectRandom);
_postions = _building call core_buildingPostions;

if (count _postions == 0)exitWith {[]call s_ems_getArea};
_location = _postions call bis_selectRandom;

if (surfaceIsWater _location)exitWith {[]call s_ems_getArea};

_location