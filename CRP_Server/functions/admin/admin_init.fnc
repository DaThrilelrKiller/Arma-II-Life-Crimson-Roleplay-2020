if (dtk_server)exitWith {};

[player,"has joined the server",[0.03,1,0.32,1]]call admin_logs_add;
["Admin Menu","ku",["7",false,false,false],admin_open]call keypress_add;
["DevCon Menu","ku",["HOME",false,false,false],dev_open]call keypress_add;
