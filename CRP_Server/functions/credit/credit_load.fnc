private ["_player","_uid","_data","_index","_creditData"];

_player = _this select 0;
_uid = getPlayerUID _player;

// Try to load from database
_creditData = [_uid,"Main","Credit",[650,0,0,0,5000,0,false,false,0,0]] call s_stats_read;

// Find or create entry in credit_playerData
_index = -1;
{
	if ((_x select 0) == _uid) exitWith {
		_index = _forEachIndex;
	};
}forEach credit_playerData;

if (_index == -1) then {
	credit_playerData set [count credit_playerData, [_uid, _creditData]];
	_index = count credit_playerData - 1;
} else {
	(credit_playerData select _index) set [1, _creditData];
};

_data = _creditData;

// Send data to player
[_player,[_data],"credit_load",false,false]call network_MPExec;

diag_log formatText ["[CREDIT] Loaded credit data for %1 (UID: %2)", name _player, _uid];
