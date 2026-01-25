private ["_geld","_bank","_score","_loanBal","_cardBal","_loanMax","_cardLimit"];

if (dialog)exitWith {closedialog 0};

if (credit_credit_running)exitWith {systemChat "Credit system is processing, please wait...";};
credit_credit_running = true;

_geld = [player,"geld"] call storage_amount;
_geld = [_geld]call Main_FormatMoney;
_bank  = [dtk_bank] call Main_FormatMoney;
_score = credit_score;
_loanBal = [credit_loanAmount] call Main_FormatMoney;
_cardBal = [credit_cardBalance] call Main_FormatMoney;
// Calculate max loan based on current credit score
credit_loanMax = [_score] call credit_getMaxLoan;
_loanMax = [credit_loanMax] call Main_FormatMoney;
_cardLimit = [credit_cardLimit] call Main_FormatMoney;

createDialog "credit_menu";

// Display current data
CtrlSetText [1000, format ["Bank: %1", _bank]];
CtrlSetText [1001, format ["Wallet: %1", _geld]];
CtrlSetText [1002, format ["Credit Score: %1", _score]];
CtrlSetText [1003, format ["Loan Balance: %1", _loanBal]];
CtrlSetText [1004, format ["Card Balance: %1", _cardBal]];
CtrlSetText [1005, format ["Max Loan: %1", _loanMax]];
CtrlSetText [1006, format ["Card Limit: %1", _cardLimit]];

if (credit_hasLoan) then {
	CtrlSetText [1007, format ["Interest Rate: %1%%", credit_loanInterest]];
} else {
	CtrlSetText [1007, "No Active Loan"];
};

if (credit_hasCard) then {
	CtrlSetText [1008, format ["Card Interest: %1%%", credit_cardInterest]];
} else {
	CtrlSetText [1008, "No Credit Card"];
};

credit_credit_running = false;
