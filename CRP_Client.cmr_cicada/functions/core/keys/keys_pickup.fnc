_keys = _this select 0;
_object = _this select 1;

{
	if !([player,_x]call keys_has)then {
		_data = _x getVariable ["dtk_keys",[]];
		_data set [count _data,getPlayerUID player];
		_x setVariable ["dtk_keys",_data,true];
		
		_display = getText(configFile >> "CfgVehicles" >> typeOf _x >> "DisplayName");
		systemchat format["You picked up the key to a: %1",_display];
	};
}forEach _keys;

if(primaryweapon player == "" and secondaryweapon player == "")then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
deletevehicle _object;