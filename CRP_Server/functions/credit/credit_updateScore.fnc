private ["_player","_change","_uid","_data","_index","_newScore"];

_player = _this select 0;
_change = _this select 1;
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
_newScore = (_data select 0) + _change;

// Clamp score between 300 and 850
if (_newScore < 300) then {_newScore = 300;};
if (_newScore > 850) then {_newScore = 850;};

_data set [0, _newScore];
(credit_playerData select _index) set [1, _data];

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

// Update client
[_player, [_data], "credit_update", false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Credit score updated for %1 (UID: %2) - Change: %3, New Score: %4", name _player, _uid, _change, _newScore];
