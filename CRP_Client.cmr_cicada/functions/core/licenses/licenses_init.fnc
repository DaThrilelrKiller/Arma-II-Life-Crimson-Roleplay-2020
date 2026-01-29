if (dtk_server)exitWith {};

private ["_name","_price","_condition","_lic","_index"];

{
	_name = (_x select 2);
	_price = (_x select 3);
	_condition = (_x select 4);
	_lic = _x select 0;
	_index = _forEachINdex;
	{
		(missionNamespace getvariable _x) addaction [format ["Buy %1 ($%2)",_name,_price],"noscript.sqf", format ["%1 call licenses_buy",_index], 1, false, true, "", format ["!('%1' in (player getvariable 'cdb_license')) && %2",_lic,_condition]];
		true
	}count (_x select 1);
	true
}forEach dtk_licenses;

["DTK_Shop_DMV_mrk",getPos DTK_Shop_DMV,nil,nil,"colorOrange","mil_dot",nil,"Licence Center"]call core_createMarkerLocal;
["DTK_Shop_DMV2_mrk",getPos DTK_Shop_DMV2,nil,nil,"colorOrange","mil_dot",nil,"Licence Center"]call core_createMarkerLocal;
