// View detailed account information including active loans and cards
private ["_loanInfo","_cardInfo","_message"];

_message = format ["=== CICADA CREDIT COMPANY - ACCOUNT SUMMARY ===\n\n"];

_message = _message + format ["Credit Score: %1\n", credit_score];
_message = _message + format ["Maximum Loan Available: %1\n\n", [credit_loanMax] call Main_FormatMoney];

// Loan Information
if (credit_hasLoan && credit_loanAmount > 0) then {
	_message = _message + format ["=== ACTIVE LOAN ===\n"];
	_message = _message + format ["Loan Balance: %1\n", [credit_loanAmount] call Main_FormatMoney];
	_message = _message + format ["Interest Rate: %1%%\n", credit_loanInterest];
	_message = _message + format ["Next Payment Due: %1 minutes\n\n", round((credit_paymentDue - time) / 60)];
} else {
	_message = _message + format ["=== LOAN STATUS ===\n"];
	_message = _message + format ["No Active Loan\n\n"];
};

// Credit Card Information
if (credit_hasCard) then {
	_message = _message + format ["=== CREDIT CARD ===\n"];
	_message = _message + format ["Card Balance: %1\n", [credit_cardBalance] call Main_FormatMoney];
	_message = _message + format ["Credit Limit: %1\n", [credit_cardLimit] call Main_FormatMoney];
	_message = _message + format ["Available Credit: %1\n", [credit_cardLimit - credit_cardBalance] call Main_FormatMoney];
	_message = _message + format ["Interest Rate: %1%%\n", credit_cardInterest];
	if (credit_cardBalance > 0) then {
		_message = _message + format ["\nWARNING: You have an outstanding balance!\n"];
	};
} else {
	_message = _message + format ["=== CREDIT CARD STATUS ===\n"];
	_message = _message + format ["No Credit Card\n"];
};

hint _message;
