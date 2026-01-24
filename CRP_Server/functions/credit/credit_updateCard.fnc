private ["_player","_balance","_uid","_data","_index"];

_player = _this select 0;
_balance = _this select 1;
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
_data set [3, _balance];

(credit_playerData select _index) set [1, _data];

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;
