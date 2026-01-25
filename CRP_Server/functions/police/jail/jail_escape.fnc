["ALL",["dtk_client",format["%1 has escaped from jail",name player],3],"network_chat",false,true]call network_MPExec;
[player,"escaping from jail",20000]call cdb_addWarrant;
dtk_disabledkeys = [];
hintSilent "";