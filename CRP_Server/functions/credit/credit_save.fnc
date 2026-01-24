private ["_player","_uid","_data","_index"];

_player = _this select 0;
_data = _this select 1;
_uid = if ((typeName _player) == "STRING")then {_player}else{getPlayerUID _player};

// Find entry in credit_playerData
_index = -1;
{
	if ((_x select 0) == _uid) exitWith {
		_index = _forEachIndex;
	};
}forEach credit_playerData;

if (_index == -1) then {
	credit_playerData set [count credit_playerData, [_uid, _data]];
} else {
	(credit_playerData select _index) set [1, _data];
};

// Save to database
[_uid, "Main", "Credit", _data] call s_stats_write;

diag_log formatText ["[CREDIT] Saved credit data for UID: %1", _uid];
