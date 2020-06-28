private ["_object","_name","_price"];

if (dtk_server)exitWith {};

DTK_Factorys = [
	[Vehiclefactory,'Vehicle Factory','vfacspawn1',DTK_VehicleFactory,150000,10,1],
	[weaponfactory,'Weapon Factory','',DTK_WeaponFactory,250000,10,1],
	[illegalweaponfactory,'Illegal Weapon Factory','',DTK_IllegalWeaponFactory,500000,5,1]
];

{
	_object = _x select 0;
	_name = _x select 1;
	_price = _x select 4;
	_object addaction ["","noscript.sqf",format["[%1,%2]call factory_buy;",_object,_price], -1, false, true, "LeanRight",format["!(_target call factory_owns) && {!([_target,'Buy %1 (%2$) (E)','\crp_data\images\tags\factory']call tag_show)}",_name,[_price] call Main_FormatMoney]];
	_object addaction ["","noscript.sqf",format["%1 call factory_Open;",_forEachIndex], -1, false, true, "LeanRight",format["(_target call factory_owns) && {!([_target,'Open %1 (E)','\crp_data\images\tags\factory']call tag_show)}",_name]];
	_object addaction ["Hire Factory Worker","noscript.sqf",format["%1 call factory_addWorkers;",_object], 25, false, true, "","_target call factory_owns"];
	_object addaction ["Factory Storage","noscript.sqf",format["[%1]call storage_trunk;",_object], 25, false, true, "","_target call factory_owns"];
}forEach DTK_Factorys;

["vehFac_mrk",getPos Vehiclefactory,nil,nil,"colorBlack","mil_dot",nil,"Vehicle Factory"]call core_createMarkerLocal;
["WepFac_mrk",getPos weaponfactory,nil,nil,"colorBlack","mil_dot",nil,"Weapon Factory"]call core_createMarkerLocal;
