private ["_units","_find"];

_units = call core_units;
_units set [count _units,"server"];
_find = if (dtk_server)then {"server"}else{str player};

MPID = format ["MP%1",(_units find _find)];
{
	format ["MP%1",_ForEachIndex] addPublicVariableEventHandler {(_this select 1) call network_Run;};
}ForEach _units;

"PGRE" addPublicVariableEventHandler {call compile (_this select 1);};	

if (dtk_client)then {
	["ALL",[player,dtk_side,getPlayerUID player],"setup_jip",false,true]call network_MPExec;
};

diag_log text "[LOG]Network System Complete!";
