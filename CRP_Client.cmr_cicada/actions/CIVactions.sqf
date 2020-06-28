
[player,["Food And Candy","noscript.sqf",'[ (bailflag call shops_index)]call shops_open; ',1,false,true,"",'player distance (nearestobjects [getpos player, ["ibr_van_BNK"],  10] select 0) < 3']]call action_add;

/*VEHICLE*/
[player,["Roll Vehicle Over","noscript.sqf",'[]spawn vehicle_unflip;',1,false,true,"",'_vcl = cursorTarget;player distance _vcl < 5 and [player,_vcl]call keys_has']]call action_add;
[player,["Pull Player Out","noscript.sqf",'cursorTarget spawn Other_pullout;',1,true,true,"",'_vcl =cursorTarget; [_vcl,["Air", "Ship", "LandVehicle"]]call core_isKindOf and player distance _vcl < 5 and count (crew _vcl) > 0 and (call INV_isArmed)']]call action_add;
[player,["Impound Vehicle","noscript.sqf",'[cursorTarget]call impound_add;',1,true,true,"",'_vcl =cursorTarget; [_vcl,["Air", "Ship", "LandVehicle"]]call core_isKindOf and player distance _vcl < 10 and player distance newimpoundlot < 15 ']]call action_add;

[player,["Tow Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["TOW",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" == "" and [player,_vcl]call keys_has']]call action_add;
[player,["Release Vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0);["RELEASE",_vcl] call Other_Towing;',1,true,true,"",'_vcl = (nearestobjects [getpos player, dtk_towers, 10] select 0); player distance _vcl < 10 and _vcl getVariable "towing" != "" and [player,_vcl]call keys_has']]call action_add;