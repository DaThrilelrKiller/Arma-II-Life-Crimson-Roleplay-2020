private ["_house","_building","_price"];

_this = if (typeName _this == "STRING")then {call compile _this}else{_this};
_house = _this select 0;
_building  = nearestBuilding (getMarkerPos _house);
_price = (typeOf _building)call house_price;

if (markerText _house != format ["%1's House", name player])exitWith {
	systemchat format ["Error: you %1 dont own this house",name player];
};

dtk_bank = dtk_bank + _price;
systemchat format ["%1 you have sold this house, money has been placed in your bank",name player];
["SERVER",[player,_house],"s_house_sell",false,false]call network_MPExec;