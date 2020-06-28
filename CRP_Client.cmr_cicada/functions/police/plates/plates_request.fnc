private ["_action"];

_action = _this select 0;


switch _action do {
	case "recive" : {
		systemchat format ["%1 has requested a plate with %2 to be made, make player requested plates for a bounous",(_this select 1),(_this select 2)];
		v_custom_plate set [count v_custom_plate,_this];
	};
	
	/* runs on the user the is requesting a player, and sends info to other clients */
	default {
		/* basicly the people makeing the plates will be in a chair named plate_mechine1 and the code is sent to them */
		{
			if !(_x emptyPositions "Driver")then {
				[driver _x,["recive",name player,ctrlText 2],"plates_request",false,false]call network_MPExec;
			};
		}forEach v_plate_mechines 
	};
};