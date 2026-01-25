_vehicle = _this select 0;
_price = _this select 1;

if (local _vehicle)exitWith {
	if ([player,"geld",-2000] call storage_add)then {
		_vehicle setVariable ["dtk_keys",[getPlayerUID player],true];
		_vehicle setVariable ["Dealer_Data",nil,true];
		systemchat format ["You retived your vehicle from the dealership, you have been pentalized %1",2000];
	}else{
		systemchat "You need 2,000$ to retive your vehicle from the Dealership!";
	};
};

if ([player,"geld",-_price] call storage_add)then {
	[_vehicle,[_vehicle,_price,name player],'dealer_sold',false,false]call network_MPExec;
	_vehicle setVariable ["dtk_keys",[getPlayerUID player],true];
	_vehicle setVariable ["DTK_OwnerUID",[[getPlayerUID player],_name,typeOf _vehicle,name player],true];
	_vehicle setVariable ["Dealer_Data",nil,true];
	systemchat format ["You have bout the vehicle for %1",[_price]call main_formatMoney];
}else{
	systemchat format ["This is a cash only dealership, you do not have enought cash on you %1",[_price]call main_formatMoney];
};