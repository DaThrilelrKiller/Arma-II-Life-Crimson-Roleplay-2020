private ["_player","_interestRate","_score","_uid","_data","_index"];

_player = _this select 0;
_interestRate = _this select 1;
_score = _this select 2;
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

// Check if already has card
if (_data select 7) exitWith {
	[_player,["You already have a credit card"],{systemChat _this},false,false]call network_MPExec;
};

// Grant credit card
_data set [0, _score]; // credit score
_data set [4, 5000]; // card limit
_data set [5, _interestRate]; // interest rate
_data set [7, true]; // has card

(credit_playerData select _index) set [1, _data];

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

// Notify player
[_player, [format ["Credit card approved! Limit: $5,000. Interest rate: %1%%", _interestRate]], {systemChat _this}, false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Credit card approved for %1 (UID: %2) - Interest: %3%%", name _player, _uid, _interestRate];
