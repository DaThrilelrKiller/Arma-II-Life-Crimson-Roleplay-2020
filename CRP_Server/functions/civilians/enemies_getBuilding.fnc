
private["_building","_postions"];

_building = (dtk_house_list call bis_selectRandom);
_positions = _building call core_buildingPostions;
diag_log str _positions;

if (count _postions < 2)exitWith {[]call s_enemies_getBuilding};

_positions
