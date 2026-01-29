// Employee rejects an application
private ["_player","_type","_index","_application","_uid","_targetPlayer"];

_player = _this select 0; // Employee
_type = _this select 1; // "loan" or "card"
_index = _this select 2;

// Check if player is employee
if !([_player] call S_credit_employeeWhitelist) exitWith {
	[_player, ["You are not authorized to reject applications."], {systemChat _this}, false, false] call network_MPExec;
};

// Get application
if (_type == "loan") then {
	if (_index >= count credit_pendingLoans) exitWith {
		[_player, ["Invalid application index."], {systemChat _this}, false, false] call network_MPExec;
	};
	_application = credit_pendingLoans select _index;
	_uid = _application select 0;
	_data = _application select 1;
	
	// Find target player
	_targetPlayer = objNull;
	{
		if (getPlayerUID _x == _uid) exitWith {
			_targetPlayer = _x;
		};
	}forEach allPlayers;
	
	// Remove from pending
	credit_pendingLoans set [_index, "REMOVE"];
	credit_pendingLoans = credit_pendingLoans - ["REMOVE"];
	
	if (!isNull _targetPlayer) then {
		[_targetPlayer, ["Your loan application has been rejected by a Cicada Credit Company employee."], {systemChat _this}, false, false] call network_MPExec;
	};
	
	[_player, ["Loan application rejected."], {systemChat _this}, false, false] call network_MPExec;
	
} else {
	if (_index >= count credit_pendingCards) exitWith {
		[_player, ["Invalid application index."], {systemChat _this}, false, false] call network_MPExec;
	};
	_application = credit_pendingCards select _index;
	_uid = _application select 0;
	_data = _application select 1;
	
	// Find target player
	_targetPlayer = objNull;
	{
		if (getPlayerUID _x == _uid) exitWith {
			_targetPlayer = _x;
		};
	}forEach allPlayers;
	
	// Remove from pending
	credit_pendingCards set [_index, "REMOVE"];
	credit_pendingCards = credit_pendingCards - ["REMOVE"];
	
	if (!isNull _targetPlayer) then {
		[_targetPlayer, ["Your credit card application has been rejected by a Cicada Credit Company employee."], {systemChat _this}, false, false] call network_MPExec;
	};
	
	[_player, ["Credit card application rejected."], {systemChat _this}, false, false] call network_MPExec;
};

// Refresh employee dialog if open (send updated pending list)  
[_player] call S_credit_getPendingApplications;

diag_log formatText ["[CREDIT] Employee %1 rejected %2 application (Index: %3)", name _player, _type, _index];
