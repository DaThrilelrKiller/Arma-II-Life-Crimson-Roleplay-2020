private ["_object"];

{
	_object = (_x select 0) createVehicle [0,0,0];
	_object setPosASL (DTK_PhotoGallery modelToWorld (_x select 1));
	_object setDir (_x select 2);
	_object call core_setVarName;
	
	player setPos getPos _object;
	
	_name = getText (configFile >> "CfgVehicles" >> _x select 0 >> "DisplayName");

	["ALL",[_object,['','noscript.sqf',format['%1 spawn gallery_take',_object],-1,false,true,'LeanRight',format['player distance _target < 5 && {!([_target,"Take %1 (E)",""]call tag_show)}',_name]]],"network_addAction",false,true]call network_MPExec;

}forEach DTK_Gallery;