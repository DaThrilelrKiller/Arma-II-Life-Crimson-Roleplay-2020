
_this = if (typeName _this == "STRING")then {call compile _this}else{_this};

_house = _this select 0;
_price = _this select 1;

if (call house_limitReached)exitWith {
	systemchat format ["Sorry, you have reached you max house limit of %1",dtk_houseLimit];
};


if (markerText _house != "")exitWith {
	systemchat format ["%1, someone already owns this house!",name player];
};

if (_price call storage_RemoveMoney)then {
	systemchat format ["%1 you have bought this house",name player];
	["SERVER",[player,_house],"s_house_buy",false,false]call network_MPExec;
}else{
	systemchat format ["%1, you need %2$ to buy this house",name player,_price];
};