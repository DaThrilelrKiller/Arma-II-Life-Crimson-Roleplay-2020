private["_building","_postions"];

_building = (dtk_buildings call bis_selectRandom);
_postions = _building call core_buildingPostions;

if (count _postions < 5)exitWith {[]call s_ems_getBuilding};
if (surfaceIsWater getPos _building)exitWith {[]call s_ems_getBuilding};

_building