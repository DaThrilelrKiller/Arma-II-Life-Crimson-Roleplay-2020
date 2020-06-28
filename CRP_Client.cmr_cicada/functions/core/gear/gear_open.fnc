private ["_cache","_weapons","_mags"];

if (gear_box_open)exitWith {
	systemchat "Gear is already open";
};

gear_box_open = true;

gear_object = _this select 0;
_cache = gear_object getVariable ["Gear",nil];

if (!isNil "_cache")then {
	_weapons = _cache select 0;
	_mags = _cache select 1;

	{
		gear_box addWeaponCargo [_x, (_weapons select 1 select _forEachIndex)];
	}forEach (_weapons select 0);

	{
		gear_box addMagazineCargo [_x, (_mags select 1 select _forEachIndex)];
	}forEach (_mags select 0);
};

gear_box setPos getPos player;
player action ["Gear", gear_box];
