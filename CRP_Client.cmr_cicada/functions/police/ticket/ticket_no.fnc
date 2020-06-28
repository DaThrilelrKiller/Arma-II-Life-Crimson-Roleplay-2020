private["_text"];

if !(dtk_payed)then {
	_text = systemchat format["%1 chose not to pay the ticket of %2",name player,dtk_amount];
	["ALL",_text,{systemchat _this},false,true]call network_MPExec;
};

dtk_payed = false;

