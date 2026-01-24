// Display credit card information
private ["_message","_hasCardItem","_available"];

_hasCardItem = ([player,"Credit_Card"] call storage_amount > 0);

if (!_hasCardItem) exitWith {
	systemChat "You don't have a credit card in your inventory.";
};

if (!credit_hasCard) exitWith {
	systemChat "Your credit card account is not active. Please contact Cicada Credit Company.";
};

_available = credit_cardLimit - credit_cardBalance;

_message = format ["=== CREDIT CARD INFORMATION ===\n\n"];
_message = _message + format ["Credit Limit: %1\n", [credit_cardLimit] call Main_FormatMoney];
_message = _message + format ["Current Balance: %1\n", [credit_cardBalance] call Main_FormatMoney];
_message = _message + format ["Available Credit: %1\n", [_available] call Main_FormatMoney];
_message = _message + format ["Interest Rate: %1%%\n\n", credit_cardInterest];
_message = _message + format ["Credit Score: %1\n", credit_score];

if (credit_cardBalance > 0) then {
	_message = _message + format ["\nWARNING: You have an outstanding balance of %1!", [credit_cardBalance] call Main_FormatMoney];
	_message = _message + format ["\nMake payments to avoid interest charges."];
};

hint _message;
