private ["_player","_amount","_uid","_data","_index","_newScore"];

_player = _this select 0;
_amount = _this select 1;
_uid = getPlayerUID _player;

// Find player data
_index = -1;
{
	if ((_x select 0) == _uid) exitWith {
		_index = _forEachIndex;
	};
}forEach credit_playerData;

if (_index == -1) exitWith {
	diag_log formatText ["[CREDIT ERROR] Player data not found for UID: %1", _uid];
};

_data = (credit_playerData select _index) select 1;

if (!(_data select 6)) exitWith {
	[_player,["You don't have an active loan"],{systemChat _this},false,false]call network_MPExec;
};

_loanAmount = _data select 1;
if (_amount > _loanAmount) then {
	_amount = _loanAmount;
};

// Apply payment
_newLoanAmount = _loanAmount - _amount;
_data set [1, _newLoanAmount];

// Update credit score (paying on time improves score)
_newScore = (_data select 0) + 5;
if (_newScore > 850) then {_newScore = 850;};
_data set [0, _newScore];

// If loan is paid off
if (_newLoanAmount <= 0) then {
	_data set [1, 0];
	_data set [2, 0];
	_data set [6, false];
	_data set [8, 0];
	_data set [9, 0];
	_newScore = _newScore + 10; // Bonus for paying off loan
	if (_newScore > 850) then {_newScore = 850;};
	_data set [0, _newScore];
	[_player,["Loan paid off! Your credit score has improved."],{systemChat _this},false,false]call network_MPExec;
} else {
	_data set [8, time]; // Update last payment time
	_data set [9, time + 3600]; // Next payment due in 1 hour
};

(credit_playerData select _index) set [1, _data];

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

// CRITICAL FIX: Update client immediately
[_player, [_data], "credit_update", false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Loan payment processed for %1 (UID: %2) - Amount: %3, Remaining: %4", name _player, _uid, _amount, _newLoanAmount];
