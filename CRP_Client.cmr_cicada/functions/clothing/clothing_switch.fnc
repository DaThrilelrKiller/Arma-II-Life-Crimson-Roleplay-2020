private ["_old","_oldweapons","_oldmags","_skin","_pos","_skinsold","_camera","_actions","_clothing"];

_skin = (_this select 0);
dtk_clothing = player getVariable ["type",typeOf player];

_old = player;
_oldweapons = weapons _old;
_oldmags    = magazines _old;
	
_pos = getposATL player;
_skinsold = player getVariable ["type",typeOf player];
_storage = player getVariable ['dtk_storage',[["schluesselbund","idcard"],[1,1]]];
_warrants = player getVariable ['cdb_warrants',[]];
_license = player getVariable ['cdb_license',[]];
_notes = player getVariable ['cdb_notes',[]];
_actions = player getVariable ['dtk_actions',[]];
_tag = player getVariable ['dtk_tag',tag_default];
call TFAR_RemoveRadios;

if (_skinsold == _skin) exitWith {
	false
};

_unit = [_skin]call clothing_create;
addSwitchableUnit _unit;
selectPlayer _unit;

_old spawn {
	waitUntil {!(isPlayer _this)};
	uiSleep 2;
	_this setPosATL [-1, -1, 0];
	_this setDamage 1;
	private["_i"];
	_i = 0;
	while { _i < 10 } do {
		hideBody _this;
		_i = _i + 1;
	};
	deleteVehicle _this;
};

removeAllWeapons _unit;
player setPosATL _pos;
player setVariable ["dtk_side",dtk_side,true];
player setVariable ['dtk_storage',_storage,true];
player setVariable ["cdb_warrants",_warrants,true];
player setVariable ["cdb_license",_license,true];
player setVariable ["cdb_notes",_notes,true];
player setVariable ["id",dtk_id,true];
player setVariable ["dtk_actions",_actions,false];
[player]call action_addAll;

player addEventHandler ["respawn", {_this call setup_respawn; _this}]; 
player addEventHandler ["fired", { _this call setup_fired;}];
player addEventHandler ["handleDamage", {_this call events_sethit}];
player addMPEventHandler ["MPKilled",{_this call killfeed_display;}];

{player addWeapon _x}count _oldweapons;
{player addMagazine _x} count _oldmags;
player setVariable ["dtk_tag",_tag,true];

["ALL",player,{_this addaction ["","noscript.sqf",format['%1 call core_interact;',_this],25,false,true,"LeanRight",format["player distance _target < 5 && {alive _target} && {!([_target,'Interact (E)','%1']call tag_show)}",player getVariable ["dtk_tag",tag_default]]];},false,false]call network_MPExec;
	
call gps_diary;
call TFAR_addRadios;
if ([player]call medical_medic)then {
	titleText ["You are now a medic", "PLAIN DOWN"];
};
	
true