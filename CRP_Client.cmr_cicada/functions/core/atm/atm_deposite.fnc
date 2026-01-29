private ["_amount"];

_amount = ctrlText 1400;

if (_amount call storage_isNumber)then {
_amount = parseNumber _amount;

	if ([player,"geld", -_amount] call storage_add)then {
	dtk_bank = dtk_bank + _amount;
	systemchat format ["You have deposted %1 into your bank acount",[_amount] call Main_FormatMoney];
	}
	else{
	systemchat format ["You dont have %1 in your wallet",[_amount] call Main_FormatMoney];
	};
closeDialog 0;
}else{
systemchat format ["%1 in not a vailid Number",_amount];
};