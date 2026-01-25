if (dtk_server)exitWith {};
[player,["Revive","noscript.sqf",'[ems_nearman]call medical_revive;',1,true,true,"",'call medical_near && {[player]call medical_medic}']]call action_add;
[player,["Drag Body","noscript.sqf",'[ems_nearman]spawn medical_drag',1,false,true,"","!medical_draging && medical_near && {[player]call medical_medic}"]]call action_add;
[player,["Drop Body","noscript.sqf",'medical_draging = false',1,false,true,"","medical_draging && {[player]call medical_medic}"]]call action_add;
