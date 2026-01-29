if (dtk_server)exitWith {};

private ["_unit","_side","_uid"];

_unit = _this select 0;
_side = _this select 1;
_uid = _this select 2;

if (player == _unit)exitWith {};

_unit addaction ["","noscript.sqf",format['%1 call core_interact;',_unit],25,false,true,"LeanRight",format["player distance _target < 5 && {alive _target} && {!([_target,'Interact (E)','%1']call tag_show)}",player getVariable ["dtk_tag",tag_default]]];
