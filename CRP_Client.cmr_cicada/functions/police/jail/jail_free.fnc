
["ALL",["dtk_client",format["%1 has served their time and is now FREE!",name player],3],"network_chat",false,true]call network_MPExec;

player setPos [7090.55,3595.28,0];	
player setdamage 0;	
player call cdb_clear_warrants;
[dtk_clothing]call clothing_switch;
dtk_disabledkeys = [];