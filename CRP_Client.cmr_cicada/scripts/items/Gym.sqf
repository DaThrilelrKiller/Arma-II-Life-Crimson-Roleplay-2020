
_item = _this select 1;

switch (_this select 1) do {
		case "GymMem1" : { dtk_player_storage = 70 };
		case "GymMem2" : { dtk_player_storage = 80 };
		case "GymMem3" : { dtk_player_storage = 90 };
		case "GymMem4" : { dtk_player_storage = 100 };
};

[player,_item, -1]call storage_add;	
systemchat format ["You now can lift up to %1 pounds, but upon death you lose your strength.", dtk_player_storage];
