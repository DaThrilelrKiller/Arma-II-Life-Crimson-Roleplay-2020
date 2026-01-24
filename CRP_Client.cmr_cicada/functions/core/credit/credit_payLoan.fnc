private ["_amount","_wallet","_bank"];

if (credit_credit_running)exitWith {systemChat "Credit system is processing, please wait...";};
credit_credit_running = true;

if (!credit_hasLoan) exitWith {
	systemChat "You don't have an active loan.";
	credit_credit_running = false;
};

_amount = ctrlText 1401;
if (!(_amount call string_isInteger)) exitWith {
	systemChat "Please enter a valid number";
	credit_credit_running = false;
};
_amount = _amount call string_toInt;

if (_amount <= 0) exitWith {
	systemChat "Payment amount must be greater than 0";
	credit_credit_running = false;
};

if (_amount > credit_loanAmount) then {
	_amount = credit_loanAmount;
};

_wallet = [player,"geld"] call storage_amount;
_bank = dtk_bank;
_total = _wallet + _bank;

if (_total < _amount) exitWith {
	systemChat format ["You don't have enough money. You need %1", [_amount] call Main_FormatMoney];
	credit_credit_running = false;
};

// Pay from wallet first, then bank
private ["_walletPay","_bankPay"];
_walletPay = if (_wallet >= _amount) then {_amount} else {_wallet};
_bankPay = _amount - _walletPay;

if (_walletPay > 0) then {
	[player,"geld",-_walletPay] call storage_add;
};

if (_bankPay > 0) then {
	dtk_bank = dtk_bank - _bankPay;
};

// Send payment to server
["SERVER",[player,_amount],"S_credit_payLoan",false,false]call network_MPExec;

systemChat format ["Payment of %1 processed", [_amount] call Main_FormatMoney];
closeDialog 0;
credit_credit_running = false;
