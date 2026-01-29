[player,["Open/Close Gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 ']]call action_add;

[player,["Roll Vehicle Over","noscript.sqf",'[]spawn vehicle_unflip;',1,false,true,"",'_vcl = cursorTarget;player distance _vcl < 5 and [player,_vcl]call keys_has']]call action_add;
[player,["Repair Vehicle","noscript.sqf",'[cursorTarget]call Other_repairvehicle;',1,true,true,"",'_vcl = cursorTarget; [_vcl,["Air", "Ship", "LandVehicle"]]call core_isKindOf && {player distance _vcl < 10}']]call action_add;
[player,["Shop 1 Export","noscript.sqf",'[ (shop1 call shops_index)]call shops_open; ',1,false,true,"","player distance shop1export <= 3"]]call action_add;
[player,["Shop 4 Export","noscript.sqf",'[ (shop4 call shops_index)]call shops_open; ',1,false,true,"","player distance shop4export <= 3"]]call action_add;
