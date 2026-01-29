private ["_unit","_corps","_time"];

_unit = _this select 0;
_corps = _this select 1;

_unit setDamage 0;
_corps setDamage 0;
["ALL",player,{_this setUnconscious true;},false,true]call network_MPExec;
["ALL",player,{_this allowDamage false;},false,true]call network_MPExec;
["ALL",player,{_this addaction ["","noscript.sqf",format['%1 call core_interact;',_this],25,false,true,"LeanRight",format["player distance _target < 5 && {alive _target} && {!([_target,'Interact (E)','%1']call tag_show)}",player getVariable ["dtk_tag",tag_default]]];},false,false]call network_MPExec;
player setVariable ["id",dtk_id,true];

removeAllWeapons _unit;
player setVariable ["tf_unable_to_use_radio", true, true];
player setVariable ["tf_voiceVolume", 0, true];
[_unit,_corps]call storage_dropall;

[]spawn medical_Effect; 

_this spawn {
	_unit = _this select 0;
	_corps = _this select 1;
	_time = time;

	/* waits until the corps is not moving to prevent another dealth */
	waitUntil {(str (velocity _corps)) == '[0,0,0]'};

	["ALL",["dtk_side == 'UN'",format ["%1 Has Died Near %3 (cords: %2)",name player, ([_corps]call Emita_GetGridRef),location_name],2],"network_chat",false,false]call network_MPExec;

	_this call medical_marker;
	_this call medical_setPos;
	[_unit,_corps,_time] spawn medical_timer;
};

