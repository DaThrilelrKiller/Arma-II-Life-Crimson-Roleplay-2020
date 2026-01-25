private ["_unit","_corps","_water","_pos","_dir"];

_unit = _this select 0;
_corps = _this select 1;
_water = (surfaceIsWater getPos _corps);
_pos = if (_water)then{([getPos _corps, 1, 600, 3, 0, 20, 1, [], [[6086,4191,0],[6086,4191,0]]] call BIS_fnc_findSafePos)}else{getPosASL _corps};

if (count _pos == 2)then {
	_pos set [count _pos,0];
};

_dir = getDir _corps;

/* Sets pos of the new body */
_unit setPosASL _pos;
_unit setDir _dir;
["ALL",[_unit,"AdthPpneMstpSlowWrflDnon_binocular"],"network_switchmove",false,true]call network_MPExec;

_corps setPos [0,0,0];

/* If is water go ahead and let everyone know */
if (_water)then {
["ALL",["dtk_client",format ["%1 has drownded in the water, and has washed up along the shore", name player],3],"network_chat",false,true]call network_MPExec;
	
	/* If  the shore cannot be found, go ahead and let the player respawn */
	if ((str _pos) == '[6086,4191,0]')then{
		call medical_terminate;
		_unit setUnconscious false;
		_unit allowDamage true;
		deleteMarker ("medical_" + name _unit);
	};

};