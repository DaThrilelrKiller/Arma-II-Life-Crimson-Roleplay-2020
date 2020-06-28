private ["_unit","_side","_vehicle","_vclClass","_trunk","_speedupgrade","_plate","_warrants","_license","_notes","_sirens","_name","_VehData","_index"];

_unit = _this select 0;
_side = _this select 1;
_vehicle  = _this select 2;

_name = _vehicle call vehicle_name;
_vclClass = (_vehicle getVariable "DTK_OwnerUID" select 1);
_trunk = _vehicle getVariable "dtk_storage";
_speedupgrade = _vehicle getvariable "tuning"; 
_speedupgrade = if (isNil "_speedupgrade")then {0}else{_speedupgrade};

_weaps = getWeaponCargo _vehicle;
_mags = getMagazineCargo _vehicle;
_plate = _vehicle getVariable  "dtk_plate";
_warrants = _vehicle getVariable ["cdb_warrants",[]];
_license = _vehicle getVariable ["cdb_license",[]];
_notes = _vehicle getVariable ["cdb_notes",[]];
_textures = _vehicle getVariable ["textures",[]];
_sirens = _vehicle getVariable ["dtk_sirens",[]];

_VehData = [_vclClass,_trunk,_speedupgrade,_weaps,_mags,_plate,_warrants,_license,_notes,_sirens,_textures];
deleteVehicle _vehicle;

_index = [getPlayeruid _unit,_side,"Vehicles"]call s_stats_getIndex;
[_unit,_side, "Vehicles",_index, _VehData]call s_stats_saveIndex;
[_unit, format ["(%1) has been saved in your garage,id; %2",_name,_index],{systemChat _this},false,false]call network_mpexec;