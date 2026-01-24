if (dtk_server)exitWith {};

// Load credit data from server
["SERVER",[player],"S_credit_load",false,false]call network_MPExec;
