private ["_weps","_mags","_holder","_i","_item","_amount","_object","_array","_items","_amounts"];

_unit = _this select 0;
_corps = _this select 1;

if (dtk_civ)then {
	_weps = weapons _corps;
	_mags = magazines _corps;

	_holder = createVehicle ["weaponholder", getPosATL _corps, [], 0, "CAN_COLLIDE" ];
	{
		if ((["ItemMap","ItemCompass","ItemRadio","ItemWatch","ItemGPS"] find _x) < 0 && {!(_x call TFAR_fnc_isRadio)})then {
			_holder addWeaponCargoGlobal [_x,1];
		};
	} count _weps;
	{
		_holder addMagazineCargoGlobal [_x,1];
	} count _mags;

	removeAllWeapons _corps;
}else{
	{
		if ((["ItemMap","ItemCompass","ItemRadio","ItemWatch","ItemGPS"] find _x) < 0 && {!(_x call TFAR_fnc_isRadio)})then {
			_unit addWeapon _x
		};
	}foreach (weapons _corps);
	{_unit addMagazine _x}foreach (magazines _corps);
};

_array = _corps getVariable ["dtk_storage",[[],[]]];
_items = _array select 0;
_amounts = _array select 1;

{
	if (_x call config_dropable)then
	{
		_amount = _amounts select _ForEachIndex;
		_class = if(_x == "geld")then{"EvMoney"}else{"Suitcase"};
		_object = _class createvehicle position _corps;
		_name13 = _x call config_displayname;

		_object call core_setVarName;	
		["ALL",[_object,['','noscript.sqf',format['%1 spawn items_pickup',[_object, _x, _amount]],25,false,true,'LeanRight',format ['player distance _target < 5 && {!([_target,"Pick up (%3) %1 (E)","data\images\items\%2"]call tag_show)}',_name13,[_x]call config_image,_amount]]],"network_addAction",false,true]call network_MPExec;
	};
}Foreach _items;

player setvariable ['dtk_storage',[["schluesselbund","idcard"],[1,1]],true];
