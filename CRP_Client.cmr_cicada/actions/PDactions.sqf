
/*OTHER*/
[DTK_ATM_PD,["Get Patrol Mission","scripts\coppatrol.sqf",["start"],1,false,true,"","!pmissionactive && {!patrolwaittime}"]]call action_add;
[DTK_ATM_PD,["Cancel My Patrol Mission","scripts\coppatrol.sqf",["end"],1,false,true,"","pmissionactive"]]call action_add;