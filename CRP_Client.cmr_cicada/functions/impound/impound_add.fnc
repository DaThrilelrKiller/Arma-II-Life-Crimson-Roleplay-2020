private ["_vehicle","_data","_owners","_owner","_name","_side","_unit","_trunk","_upgrade","_weapons","_magazines","_plate","_license","_sirens","_displayname"];

_vehicle = _this select 0;

_data = (_vehicle getVariable "DTK_OwnerUID");
_owners = _vehicle getVariable["dtk_keys",[]];
_owner = _owners select 0;
_name = (_data select 1);
_side = (_data select 2);
_unit = if (dtk_server)then {"Server Cleaner"}else {(name player)};
	
/* Vehicle data */
_trunk = _vehicle getVariable ["dtk_storage",[[],[]]];
_upgrade = _vehicle getvariable ["tuning",0];
_weapons = getWeaponCargo _vehicle;
_magazines = getMagazineCargo _vehicle;
_plate = _vehicle getVariable  "dtk_plate";
_license = _vehicle getVariable ["cdb_license",[]];
_sirens = weapons _vehicle;
_displayname = _vehicle call vehicle_name;

v_impound set [count v_impound, [_name,_trunk,_upgrade,_weapons,_magazines,_plate,[],_license,[],_sirens,_owner,_side]];
publicvariable "v_impound";
deleteVehicle _vehicle;
["SERVER",[],"s_impound_save",false,false]call network_MPExec;

if !([player,_vehicle]call keys_has)then {
[player,"geld",50] call storage_add; 
systemchat format ["you have been paid 50$ for impound (%1)",_displayname];
};


["ALL",[_displayname,_unit,_owners,_side,location_name],"impound_nofity",false,true]call network_MPExec;