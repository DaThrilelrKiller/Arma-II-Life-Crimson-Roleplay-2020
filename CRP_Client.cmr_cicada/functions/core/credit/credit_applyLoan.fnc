private ["_amount","_uid"];

if (credit_credit_running)exitWith {systemChat "Credit system is processing, please wait...";};
credit_credit_running = true;

_amount = ctrlText 1400;
if (!(_amount call string_isInteger)) exitWith {
	systemChat "Please enter a valid number";
	credit_credit_running = false;
};
_amount = _amount call string_toInt;

if (_amount <= 0) exitWith {
	systemChat "Loan amount must be greater than 0";
	credit_credit_running = false;
};

if (_amount > credit_loanMax) exitWith {
	systemChat format ["Maximum loan amount is %1", [credit_loanMax] call Main_FormatMoney];
	credit_credit_running = false;
};

if (credit_hasLoan) exitWith {
	systemChat "You already have an active loan. Please pay it off first.";
	credit_credit_running = false;
};

if (credit_score < 500) exitWith {
	systemChat "Your credit score is too low to qualify for a loan. Minimum required: 500";
	credit_credit_running = false;
};

// Calculate interest rate based on credit score
private ["_interestRate"];
_interestRate = switch (true) do {
	case (credit_score >= 750): {5}; // Excellent credit
	case (credit_score >= 700): {7}; // Good credit
	case (credit_score >= 650): {10}; // Fair credit
	case (credit_score >= 600): {15}; // Poor credit
	default {20}; // Bad credit
};

// Request loan from server
_uid = getPlayerUID player;
["SERVER",[player,_amount,_interestRate,credit_score],"S_credit_applyLoan",false,false]call network_MPExec;

systemChat format ["Loan application submitted for %1. Interest rate: %2%%", [_amount] call Main_FormatMoney, _interestRate];
closeDialog 0;
credit_credit_running = false;
