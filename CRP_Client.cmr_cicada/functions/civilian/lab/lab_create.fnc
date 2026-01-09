private ["_item","_pos","_lab"];

if !(call house_nearHouse) exitWith {
	systemchat "You must be at your house to use the drug lab";
};

_item    = _this select 1;
[player,_item,-1] call storage_add;

_pos = getPosASL player;
_dir = getDir player;

_lab = createVehicle ["a2l_methlab",[0,0,0], [], 0, "CAN_COLIDE"];
_lab setdir (getdir player) + 180;
_lab setposASL (getPosASL player);
_lab call core_setVarName;	

_lab addaction ["","noscript.sqf",format["%1 call lab_open",_lab], 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'Open Lab (E)','data\images\tags\meth']call tag_show)}","",""]];
_lab addaction ["Storage","noscript.sqf",format["[%1]call storage_trunk",_lab], 25, false, true, "",format ["player distance _target < 5 && {!DTK_LacingUp}","",""]];
_lab addaction ["Process LSD","scripts\itemprocess.sqf",["Unprocessed_LSD", "lsd", 5],1,false,true,"",""];
_lab addaction ["Process Cocaine","scripts\itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5],1,false,true,"",""];
_lab addaction ["Process Marijuana","scripts\itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5],1,false,true,"",""];
_lab addaction ["Process Heroin","scripts\itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5],1,false,true,"",""];

["ALL",[_lab,['','noscript.sqf',format['deleteVehicle %1;',_lab],25,false,true,'LeanRight',format ['dtk_cop && {player distance _target < 5} && {!([_target,"Remove Drug Lab (E)","%1"]call tag_show)}',"data\images\tags\meth"]]],"network_addAction",false,true]call network_MPExec;