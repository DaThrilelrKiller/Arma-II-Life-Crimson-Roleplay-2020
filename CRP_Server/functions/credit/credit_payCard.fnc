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

if (!(_data select 7)) exitWith {
	[_player,["You don't have a credit card"],{systemChat _this},false,false]call network_MPExec;
};

_cardBalance = _data select 3;
if (_amount > _cardBalance) then {
	_amount = _cardBalance;
};

// Apply payment
_newCardBalance = _cardBalance - _amount;
_data set [3, _newCardBalance];

// Update credit score (paying on time improves score)
_newScore = (_data select 0) + 3;
if (_newScore > 850) then {_newScore = 850;};
_data set [0, _newScore];

_data set [8, time]; // Update last payment time

(credit_playerData select _index) set [1, _data];

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

// CRITICAL FIX: Update client immediately
[_player, [_data], "credit_update", false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Credit card payment processed for %1 (UID: %2) - Amount: %3, Remaining: %4", name _player, _uid, _amount, _newCardBalance];
