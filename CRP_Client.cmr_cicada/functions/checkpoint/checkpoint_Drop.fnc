detach temp_item;
AM_temp_carrying = false;
temp_item setVariable ["AM_CP",1,true];
temp_item call core_setVarName;
[temp_item] call checkpoint_addActions;