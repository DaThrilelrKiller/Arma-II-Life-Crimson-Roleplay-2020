if (dtk_server)exitWith {};

chat_channels = [
	["Global Chat","",[1,1,1,1],"#FFFFFF"],
	["Side Chat",format["dtk_side == '%1'",call {dtk_side}],[0.259,0.525,0.957,1],"#4286f4"],
	["Gang Chat","false",[0.957,0.259,0.294,1],"#f4424b"],
	["Admin Chat","SwagDevs || {adminlevel4} || {adminlevel3} || {adminlevel2}",[0.369,0.757,0.737,1],"#5ec1bc"],
	["Direct Chat",format["player distance %1 < 11",call{player}],[0.957,0.663,0.255,1],"#f4a941"]
];

[]spawn chat_lable;
[]spawn chat_handler;