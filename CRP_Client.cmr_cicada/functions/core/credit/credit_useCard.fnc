private ["_amount","_wallet","_bank","_available"];

_amount = _this select 0;

if (!credit_hasCard) exitWith {
	systemChat "You don't have a credit card.";
	false
};

_available = credit_cardLimit - credit_cardBalance;

if (_amount > _available) exitWith {
	systemChat format ["Insufficient credit limit. Available: %1", [_available] call Main_FormatMoney];
	false
};

// Add to credit card balance
credit_cardBalance = credit_cardBalance + _amount;

// Update on server
["SERVER",[player,credit_cardBalance],"S_credit_updateCard",false,false]call network_MPExec;

systemChat format ["Charged %1 to credit card. New balance: %2", [_amount] call Main_FormatMoney, [credit_cardBalance] call Main_FormatMoney];
true
