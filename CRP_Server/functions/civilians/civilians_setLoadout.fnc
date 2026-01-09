private["_unit","_loadout","_items","_weapons","_license"];

_unit = _this select 0;


_loadout = call (DTK_CIV_Loadouts call BIS_selectRandom);

_items =  _loadout select 0;
_weapons =  _loadout select 1;
_license =  _loadout select 2;

{
	[_unit,_x select 0,_x select 1]call storage_add;
}count _items;

{
	if ([(_x select 0),"Rifle"]call holster_kind || {[(_x select 0),"Pistol"]call holster_kind}) then {
		_unit addWeapon ((_x select 0)call config_class);
	} else {
		_unit addMagazine [((_x select 0)call config_class), (_x select 1)];		
	};
}count _weapons;

{
	[_unit,_x]call licenses_add;
}count _license;