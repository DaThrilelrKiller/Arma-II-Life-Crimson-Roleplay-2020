[player,["Remove Spike Strip","noscript.sqf",'if ([player,"spikestrip",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "spikestrip") && {player distance cursorTarget < 4}']]call action_add;
[player,["Take Criminal Evidence","noscript.sqf",'{deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,true,true,"",'(typeOf cursorTarget == "weaponholder") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Stop Sign","noscript.sqf",'if ([player,"glt_roadsign_octagon",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "glt_roadsign_octagon") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Concrete Barrier Short","noscript.sqf",'if ([player,"il_barrier",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "il_barrier") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Searchlight","noscript.sqf",'if ([player,"SearchLight_UN_EP1",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "SearchLight_UN_EP1") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Roadblock","noscript.sqf",'if ([player,"roadblock",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "Land_CncBlock_Stripes") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Bar Gate","noscript.sqf",'if ([player,"Bargate",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "ZavoraAnim") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Road Cone","noscript.sqf",'if ([player,"roadcone",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "Land_coneLight") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Bunker (small)","noscript.sqf",'if ([player,"bunkersmall",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "Land_fortified_nest_small") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Danger Sign","noscript.sqf",'if ([player,"danger",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "Sign_Danger") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Ladder","noscript.sqf",'if ([player,"land_ladder_half",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "land_ladder_half") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Road Barrier","noscript.sqf",'if ([player,"Roadbarrier_long",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "RoadBarrier_long") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Road Barrier","noscript.sqf",'if ([player,"RoadBarrier_light",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "RoadBarrier_light") && {player distance cursorTarget < 4}']]call action_add;
[player,["Remove Caution Tape","noscript.sqf",'if ([player,"10mTape",1] call storage_add)then {deletevehicle cursorTarget}',1,true,true,"",'(typeOf cursorTarget == "10mTape") && {player distance cursorTarget < 4}']]call action_add;

/*SHOPS*/
[player,["Shop 1 Export","noscript.sqf","[ (shop1 call shops_index)]call shops_open; ",1,false,true,"","player distance shop1export <= 3"]]call action_add;
[player,["Shop 4 Export","noscript.sqf","[ (shop4 call shops_index)]call shops_open; ",1,false,true,"","player distance shop4export <= 3"]]call action_add;

/*OTHER*/
[player,["Get Patrol Mission","scripts\coppatrol.sqf",["start"],1,false,true,"","player distance copbank <= 4 and !pmissionactive and !patrolwaittime"]]call action_add;
[player,["Cancel My Patrol Mission","scripts\coppatrol.sqf",["end"],1,false,true,"","pmissionactive and player distance copbank <= 4"]]call action_add;
[player,["Reset Targets","noscript.sqf",'{_x animate["terc",0]} count (nearestobjects [getpos player, ["TargetEpopup"],  500])',1,true,true,"",'player distance targetrange1 < 10']]call action_add;
[player,["Reset Targets","noscript.sqf",'{_x animate["terc",0]} count (nearestobjects [getpos player, ["TargetEpopup"],  500])',1,true,true,"",'player distance targetrange2 < 10']]call action_add;
[player,["Escort VIP", "noscript.sqf", "[VIPtarget] join (group player); systemChat  ""Escort The VIP To The Police Base Before He Is Assassinated!"";",1,false,true,"","player distance VIPtarget < 5"]]call action_add;
[player,["Remove Blindfold","FUNCTIONS\ITEMS\blindfold.sqf",[],1,false,true,"","isPlayer cursorTarget and cursorTarget getVariable 'blindfolded'"]]call action_add;

/*VEHICLE*/
[player,["Roll Vehicle Over","noscript.sqf",'[]spawn vehicle_unflip;',1,false,true,"",'_vcl = cursorTarget; player distance _vcl < 5 and [player,_vcl]call keys_has']]call action_add;
[player,[localize "STRS_addaction_trunk_see","noscript.sqf",'[cursorTarget]call storage_seach;',1,true,true,"",'_vcl = cursorTarget; [_vcl,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _vcl < 10}']]call action_add;

[player,["Tow Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["TOW",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" == "" and [player,_vcl]call keys_has']]call action_add;
[player,["Release Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["RELEASE",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" != "" and [player,_vcl]call keys_has']]call action_add;