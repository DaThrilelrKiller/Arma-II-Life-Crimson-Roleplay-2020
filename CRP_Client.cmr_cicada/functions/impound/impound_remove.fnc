private ["_index","_vehicle","_data","_owners","_owner","_name","_side","_unit","_trunk","_upgrade","_weapons","_magazines","_plate","_warrants","_license","_notes","_sirens","_displayname"];


if ((lbCurSel 1) == -1)exitWith {
	systemchat "No vehicle selected";
};

_index = parseNumber (lbData [1,(lbCurSel 1)]);
_data = v_impound select _index;

_name = _data select 0;
_trunk = _data select 1;
_upgrade = _data select 2;
_upgrade = if (_upgrade == 0)then {nil}else{_upgrade};
_weapons = _data select 3;
_magazines = _data select 4;
_plate = _data select 5;
_warrants = _data select 6;
_license = _data select 7;
_notes = _data select 8;
_sirens = _data select 9;

_vehicle = [_name,impoundarea2,player,dtk_side,_plate]call shops_createVehicle;

clearWeaponCargo _vehicle;
clearMagazineCargo _vehicle;

_vehicle setVariable ["dtk_storage",_trunk,true];
_vehicle setVariable ["tuning",_upgrade,true];
_vehicle setVariable ["cdb_warrants",_warrants,true];
_vehicle setVariable ["cdb_license",_license,true];
_vehicle setVariable ["cdb_notes",_notes,true];

{_vehicle addWeaponCargo [_x, (_weapons select 1 select _forEachIndex)];}forEach (_weapons select 0);
{_vehicle addMagazineCargo [_x, (_magazines select 1 select _forEachIndex)];}forEach (_magazines select 0);
{_vehicle removeWeapon _x;}forEach (weapons _vehicle);
{_vehicle addWeapon _x;}forEach _sirens;

systemchat format ["(%1) has been retrived from your garage,you can find it on a nearby road",lbText [1, (lbCurSel 1)]];
closeDialog 0;

v_impound set [_index,""];
v_impound = v_impound - [""];


["SERVER",[],"s_impound_save",false,false]call network_MPExec;