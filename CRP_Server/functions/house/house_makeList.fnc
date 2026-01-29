private ["_houses","_doors"];

dtk_house_list = [];

_houses = nearestObjects [dtk_center, ['House'], dtk_center select 0];

{
	_doors = [_x]call house_doors;
	if (count _doors > 0 && {!(typeOf _x in DTK_NotHouses)})then {
		dtk_house_list set[count dtk_house_list,_x];
	};
}forEach _houses;


publicVariable "dtk_house_list";