private ["_amount","_price"];

_amount = _this select 0;
_price = _this select 1;

if ([player,"geld", -_price] call storage_add)then{
	if ([player,"Donut", _amount] call storage_add)then{
		systemchat format ["You have purchased %1 Donuts for %2",_amount,_price];
	}else{
		systemchat format ["You do not have enought space for %1 Donut",_amount];
		[player,"geld",_price] call storage_add;
	};
}else{
	systemchat format ["You do not have enough money for %1 Donuts",_amount];
};