
/*OTHER*/
[DTK_ATM_PD,["Get Patrol Mission","scripts\coppatrol.sqf",["start"],1,false,true,"","!pmissionactive && {!patrolwaittime}"]]call action_add;
[DTK_ATM_PD,["Cancel My Patrol Mission","scripts\coppatrol.sqf",["end"],1,false,true,"","pmissionactive"]]call action_add;

[player,["Escort VIP", "noscript.sqf", "[VIPtarget] join (group player); systemChat  ""Escort The VIP To The Police Base Before He Is Assassinated!"";",1,false,true,"","player distance VIPtarget < 5"]]call action_add;
[player,["Remove Blindfold","scripts\items\blindfold.sqf",[],1,false,true,"","isPlayer cursorTarget and cursorTarget getVariable 'blindfolded'"]]call action_add;

/*VEHICLE*/
[player,[localize "STRS_addaction_trunk_see","noscript.sqf",'[cursorTarget]call storage_seach;',1,true,true,"",'_vcl = cursorTarget; [_vcl,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _vcl < 10}']]call action_add;

[player,["Tow Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["TOW",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" == "" and [player,_vcl]call keys_has']]call action_add;
[player,["Release Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["RELEASE",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" != "" and [player,_vcl]call keys_has']]call action_add;