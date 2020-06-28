private ["_vehicle","_data","_Scriptname","_trunk","_upgrades","_weaps","_mags","_plate","_warrants","_Licences","_notes","_sirens","_color","_index"];

_vehicle = _this select 0;
_data = _this select 1;
_index = _data select 1;
_data = _data select 0;

_Scriptname = _data select 0;
_trunk = _data select 1;
_upgrades = _data select 2;
_upgrades = if (_upgrades == 0)then{nil}else{_upgrades};
_weaps = _data select 3;
_mags = _data select 4;
_warrants = _data select 6;
_Licences = _data select 7;
_notes = _data select 8;
_sirens = _data select 9;
_color = _data select 10;

["SERVER",[player,dtk_side, "Vehicles",_index,[]],"s_stats_saveIndex",false,false]call network_mpexec;

/*remove default weapons*/
clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;
removeallweapons _vehicle;

/*add saved data*/
_vehicle setvariable ['tuning', _upgrades, true]; 
_vehicle setvariable ['dtk_storage',_trunk, true]; 
_vehicle setVariable ['cdb_warrants',_warrants,true];
_vehicle setVariable ['cdb_license',_Licences,true];
_vehicle setVariable ['cdb_notes',_notes,true];
_vehicle setVariable ['dtk_sirens',_sirens,true];

_vehicle setVariable ['textures',_color,true];
[_Scriptname,_vehicle]call vehicle_texture;

{
	_vehicle addWeaponCargoGlobal [_x, (_weaps select 1 select _forEachIndex)];
}forEach (_weaps select 0);
{
	_vehicle addMagazineCargoGlobal [_x, (_mags select 1 select _forEachIndex)];
}forEach (_mags select 0);	