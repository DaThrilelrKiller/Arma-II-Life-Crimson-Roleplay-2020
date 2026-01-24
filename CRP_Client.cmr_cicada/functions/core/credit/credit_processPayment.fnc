// Process payment using credit card
// Returns true if payment successful, false otherwise
// Usage: [_cost] call credit_processPayment;
private ["_cost","_hasCard","_available","_currentBalance"];

_cost = _this select 0;

// Check if player has credit card item in inventory
_hasCard = ([player,"Credit_Card"] call storage_amount > 0);

if (!_hasCard) exitWith {
	false
};

// Check if player has active credit card account
if (!credit_hasCard) exitWith {
	systemChat "You have a credit card item but your account is not active. Please contact Cicada Credit Company.";
	false
};

// Check available credit
_currentBalance = credit_cardBalance;
_available = credit_cardLimit - _currentBalance;

if (_cost > _available) exitWith {
	systemChat format ["Insufficient credit limit. Available: %1, Needed: %2", [_available] call Main_FormatMoney, [_cost] call Main_FormatMoney];
	false
};

// Charge to credit card
credit_cardBalance = credit_cardBalance + _cost;

// Update on server
["SERVER",[player,credit_cardBalance],"S_credit_updateCard",false,false]call network_MPExec;

systemChat format ["Charged %1 to credit card. New balance: %2", [_cost] call Main_FormatMoney, [credit_cardBalance] call Main_FormatMoney];
true
