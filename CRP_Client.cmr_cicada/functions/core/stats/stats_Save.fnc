if (isNil "dtk_seasion" or isNil "AR_StaticsLoaded")exitWith {systemChat "[SAVE ABORTED]Your stats have not loaded yet"};
private ["_save"];
_save = 
[player,dtk_side,
	[
		dtk_bank,
		name player,
		dtk_hunger, 	
		player getVariable "dtk_storage", 
		player getvariable "cdb_license", 	
		player getVariable ["Pistol",""], 	
		player getVariable ["Rifle",""], 
		player getVariable ["DDOPP_X3",""], 
		weapons player, 
		magazines player,
		player getvariable "cdb_warrants",
		player getvariable "cdb_notes",
		DTK_House_Logic getVariable["dtk_storage",[[],[]]],
		DTK_House_Logic getVariable["Gear",""],
		INVAppsInstalled,
		lifeState player,
		[s_seasion,time,getPos player,dtk_side],
		[dtk_side,s_seasion],
		player getVariable ["type",typeOf player],
		player getVariable ["textures",[]]
	]
];

["SERVER",_save,"S_stats_save",false,false]call network_MPExec;

if (isnull (findDisplay 49)) then {
	['Saving data to database...','data\images\tags\save']call tag_notify
};