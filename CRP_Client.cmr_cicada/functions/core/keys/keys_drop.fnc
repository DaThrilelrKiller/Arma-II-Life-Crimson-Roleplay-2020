private ["_keys","_class","_name","_text","_pos","_object"];

_keys = _this;

if (typeName _keys == "OBJECT")then {
	_keys = []call keys_grab;
}else{
	_keys = missionNameSpace getVariable _keys;
};

_class = "schluesselbund" call config_class;
_class = if (isClass (configFile >> "CfgVehicles" >> _class))then{_class}else{"Suitcase"};

if (count _keys == 1)then {
	_name = getText (configFile >> "CfgVehicles" >> typeOf (_keys select 0) >> "DisplayName");
	_text = format ["%1 Key",_name];
	if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
}else{
	_text = format["%1's Keychain (%2)Keys",name player,count _keys];
};



_pos = getPos player;
_object = _class createvehicle _pos;
_object call core_setVarName;	
	
["ALL",[_object,['','noscript.sqf',format["[%1,%2] spawn keys_pickup",_keys,_object],25,false,true,'LeanRight',format ['player distance _target < 5 && {!([_target,"%1","data\images\items\keychain"]call tag_show)}',_text]]],"network_addAction",false,true]call network_MPExec;