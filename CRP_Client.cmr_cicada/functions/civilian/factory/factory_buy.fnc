private ["_object","_price","_owner"];

_object = _this select 0;
_price = _this select 1;
_owner = _object getVariable ["dtk_owner",""];

if (_owner != "")exitWith {
	if (_owner == name player)then {
		systemchat "You already own this factory";
	}else{
		systemchat format ["%1 owns this factory contact them if you want somting made",_owner];
	};
};

if ([player,"geld", -_price] call storage_add)then {
	systemchat format ["%1 you have bought this factory",name player];
	_object setVariable ["dtk_owner",name player,true];
}else{
	systemchat format ["%1, you need %2$ to buy this factory",name player,_price];
};