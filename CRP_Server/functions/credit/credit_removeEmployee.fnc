// Remove employee from whitelist (admin function)
// Uses the standard whitelist system with ccc_id
private ["_player","_targetPlayer"];

_player = _this select 0;
_targetPlayer = _this select 1;

// Check if not whitelisted
if (!(missionNamespace getVariable ["ccc_id", false])) exitWith {
	[_player, ["Player is not in the employee whitelist."], {systemChat _this}, false, false] call network_MPExec;
};

// Use the standard whitelist system to remove ccc_id
[_player, _targetPlayer, "ccc_id", false] call s_whitelist_add;

[_player, [format ["%1 has been removed as a Cicada Credit Company employee.", if ((typeName _targetPlayer) == "STRING")then {_targetPlayer}else{name _targetPlayer}]], {systemChat _this}, false, false] call network_MPExec;

diag_log formatText ["[CREDIT] Employee removed - Player: %1, Removed by: %2", if ((typeName _targetPlayer) == "STRING")then {_targetPlayer}else{name _targetPlayer}, name _player];
