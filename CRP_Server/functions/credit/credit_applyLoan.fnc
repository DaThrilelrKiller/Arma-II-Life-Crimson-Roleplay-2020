private ["_player","_amount","_interestRate","_score","_uid","_data","_index"];

_player = _this select 0;
_amount = _this select 1;
_interestRate = _this select 2;
_score = _this select 3;
_uid = getPlayerUID _player;

// Find player data
_index = -1;
{
	if ((_x select 0) == _uid) exitWith {
		_index = _forEachIndex;
	};
}forEach credit_playerData;

if (_index == -1) then {
	_data = [650,0,0,0,5000,0,false,false,0,0];
	credit_playerData set [count credit_playerData, [_uid, _data]];
	_index = count credit_playerData - 1;
} else {
	_data = (credit_playerData select _index) select 1;
};

// Check if already has loan
if (_data select 6) exitWith {
	[_player,["You already have an active loan"],{systemChat _this},false,false]call network_MPExec;
};

// Check maximum loan amount based on credit score
private ["_maxLoan"];
_maxLoan = [_score] call S_credit_getMaxLoan;
if (_amount > _maxLoan) exitWith {
	private ["_formattedMax"];
	_formattedMax = format['$%1', _maxLoan];
	[_player, [format ["Loan amount exceeds your maximum allowed loan of %1 based on your credit score.", _formattedMax]], {systemChat _this}, false, false] call network_MPExec;
};

// Grant loan
_data set [0, _score]; // credit score
_data set [1, _amount]; // loan amount
_data set [2, _interestRate]; // interest rate
_data set [6, true]; // has loan
_data set [8, time]; // last payment time
_data set [9, time + 3600]; // payment due (1 hour)

(credit_playerData select _index) set [1, _data];

// Add money to player's bank (send to client)
[_player, _amount, "network_sendMoney", false, false] call network_MPExec;

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

// Notify player
private ["_formattedAmount"];
_formattedAmount = format['$%1', _amount];
[_player, [format ["Loan approved! %1 has been added to your bank account. Interest rate: %2%%", _formattedAmount, _interestRate]], {systemChat _this}, false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Loan approved for %1 (UID: %2) - Amount: %3, Interest: %4%%", name _player, _uid, _amount, _interestRate];
