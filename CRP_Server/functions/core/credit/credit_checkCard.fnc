// Check if player can use credit card for payment
// Returns true if credit card is available and has sufficient credit
private ["_cost","_hasCard","_available"];

_cost = _this select 0;

// Check if player has credit card item
_hasCard = ([player,"Credit_Card"] call storage_amount > 0);

if (!_hasCard) exitWith {
	false
};

// Check if player has active credit card account
if (!credit_hasCard) exitWith {
	false
};

// Check available credit
_available = credit_cardLimit - credit_cardBalance;

if (_cost > _available) exitWith {
	false
};

true
