/*
File: fn_LoadAcount.sqf
Desc: Loads statics for a player it modular for all fractions
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

private ["_stats","_UID"];
_UID = _this select 0;
dtk_id = _this select 1;
_stats = _this select 2;
removeAllWeapons player;

if ((getPlayerUID player) != _UID)exitWith {
	systemChat format ["Almost loaded with (%1`s) stats requesting stats again",_UID];
	[]spawn {
		sleep 10;
		["SERVER",[player,dtk_side],"s_stats_load",false,false]call network_MPExec;
	};
};

dtk_bank = (_stats select 0);
dtk_hunger = (_stats select 1);
dtk_dob = (_stats select 23);

player setVariable ["dtk_storage",(_stats select 2), true];
player setVariable ["cdb_license",(_stats select 3),true];
INVVehiclesLand = (_stats select 4);
{player addWeapon _x}count (_stats select 5);
{player addMagazine _x} count (_stats select 6);
player setVariable ["Pistol",(_stats select 7),true];
player setVariable ["Rifle",(_stats select 8),true];
player setVariable ["DDOPP_X3",(_stats select 9),true];
player setVariable ["cdb_warrants",(_stats select 10),true];
player setVariable ["cdb_notes",(_stats select 11),true];
DTK_House_Logic setVariable ["dtk_storage",(_stats select 22)];

if (count(_stats select 24) != 0)then {
	DTK_House_Logic setVariable ["Gear",(_stats select 24)];
};



INVAppsInstalled = (_stats select 13);

// Automatically add judge app if player is a judge (check after whitelist loads)
[] spawn {
	waitUntil {!isNil "AR_Whitelistloaded"};
	if (call court_isJudge) then {
		if (!("app_judge" in INVAppsInstalled)) then {
			INVAppsInstalled set [count INVAppsInstalled, "app_judge"];
		};
	};
};

if ((_stats select 14) == "UNCONSCIOUS")then {
["ALL",["dtk_client",format ["[RELOG DETECTION] caught %2%1 loging in after being dead, this could be a mistake", name player, player],3],"network_chat",false,false]call network_MPExec;
};
setViewDistance (_stats select 15);
dtk_grass = (_stats select 16);
if (isNil "dtk_detail") then {
	dtk_detail = [50, 25, 12.5, 6.25, 3.125];
};
if (dtk_grass < 0 || dtk_grass >= count dtk_detail) then {
	dtk_grass = 0;
};
setTerrainGrid (dtk_detail select dtk_grass);

dtk_seasion = (_stats select 17);
_side = (_stats select 18);
_name = _stats select 19;
_clothing = (_stats select 20);
if (_clothing != "" && {typeOf player != _clothing})then {
	[_clothing]call clothing_switch;
	player setVariable ["textures",(_stats select 21)];
	player call clothing_texture;
}else {
	[]call setup_newPlayer;
};

if ((_side select 0) != dtk_side && {(_side select 1) == s_seasion})then {
	["ALL",[name player,(_side select 0),dtk_side],{systemchat format ["%1 switched from %2 to %3",_this select 0,_this select 1,_this select 2];},false,true]call network_MPExec;
};

if (_name != name player && {_name != ""})then {
	["ALL",[_name,name player],{systemchat format ["%1 is now know as %2",_this select 0,_this select 1];},false,true]call network_MPExec;
};

diag_log text "[LOG]Statitics Loaded!";
AR_StaticsLoaded = true;