// Employee approves an application
private ["_player","_type","_index","_application","_uid","_data","_amount","_interestRate","_score","_targetPlayer"];

_player = _this select 0; // Employee
_type = _this select 1; // "loan" or "card"
_index = _this select 2;

// Check if player is employee
if !([_player] call S_credit_employeeWhitelist) exitWith {
	[_player, ["You are not authorized to approve applications."], {systemChat _this}, false, false] call network_MPExec;
};

// Get application
if (_type == "loan") then {
	if (_index >= count credit_pendingLoans) exitWith {
		[_player, ["Invalid application index."], {systemChat _this}, false, false] call network_MPExec;
	};
	_application = credit_pendingLoans select _index;
	_uid = _application select 0;
	_data = _application select 1;
	_amount = _data select 1;
	_interestRate = _data select 2;
	_score = _data select 3;
	
	// Find target player
	_targetPlayer = objNull;
	{
		if (getPlayerUID _x == _uid) exitWith {
			_targetPlayer = _x;
		};
	}forEach allPlayers;
	
	if (isNull _targetPlayer) exitWith {
		[_player, ["Player is not online."], {systemChat _this}, false, false] call network_MPExec;
	};
	
	// Process loan approval directly (bypass credit score check)
	private ["_loanData","_loanIndex","_loanUid"];
	_loanUid = getPlayerUID _targetPlayer;
	_loanIndex = -1;
	{
		if ((_x select 0) == _loanUid) exitWith {
			_loanIndex = _forEachIndex;
		};
	}forEach credit_playerData;
	
	if (_loanIndex == -1) then {
		_loanData = [650,0,0,0,5000,0,false,false,0,0];
		credit_playerData set [count credit_playerData, [_loanUid, _loanData]];
		_loanIndex = count credit_playerData - 1;
	} else {
		_loanData = (credit_playerData select _loanIndex) select 1;
	};
	
	// Grant loan
	_loanData set [0, _score];
	_loanData set [1, _amount];
	_loanData set [2, _interestRate];
	_loanData set [6, true];
	_loanData set [8, time];
	_loanData set [9, time + 3600];
	
	(credit_playerData select _loanIndex) set [1, _loanData];
	
	// Add money to player's bank
	[_targetPlayer, _amount, "network_sendMoney", false, false] call network_MPExec;
	
	// Save to database
	[_loanUid, "Main", "Credit", _loanData] call s_stats_write;
	
	// Update client
	[_targetPlayer, [_loanData], "credit_update", false, false] call network_MPExec;
	
	// Remove from pending
	credit_pendingLoans set [_index, "REMOVE"];
	credit_pendingLoans = credit_pendingLoans - ["REMOVE"];
	
	[_player, [format ["Loan approved for %1", name _targetPlayer]], {systemChat _this}, false, false] call network_MPExec;
	[_targetPlayer, ["Your loan application has been approved by a Cicada Credit Company employee!"], {systemChat _this}, false, false] call network_MPExec;
	
} else {
	if (_index >= count credit_pendingCards) exitWith {
		[_player, ["Invalid application index."], {systemChat _this}, false, false] call network_MPExec;
	};
	_application = credit_pendingCards select _index;
	_uid = _application select 0;
	_data = _application select 1;
	_interestRate = _data select 2;
	_score = _data select 3;
	
	// Find target player
	_targetPlayer = objNull;
	{
		if (getPlayerUID _x == _uid) exitWith {
			_targetPlayer = _x;
		};
	}forEach allPlayers;
	
	if (isNull _targetPlayer) exitWith {
		[_player, ["Player is not online."], {systemChat _this}, false, false] call network_MPExec;
	};
	
	// Process card approval directly (bypass credit score check)
	private ["_cardData","_cardIndex","_cardUid"];
	_cardUid = getPlayerUID _targetPlayer;
	_cardIndex = -1;
	{
		if ((_x select 0) == _cardUid) exitWith {
			_cardIndex = _forEachIndex;
		};
	}forEach credit_playerData;
	
	if (_cardIndex == -1) then {
		_cardData = [650,0,0,0,5000,0,false,false,0,0];
		credit_playerData set [count credit_playerData, [_cardUid, _cardData]];
		_cardIndex = count credit_playerData - 1;
	} else {
		_cardData = (credit_playerData select _cardIndex) select 1;
	};
	
	// Grant credit card
	_cardData set [0, _score];
	_cardData set [4, 5000];
	_cardData set [5, _interestRate];
	_cardData set [7, true];
	
	(credit_playerData select _cardIndex) set [1, _cardData];
	
	// Save to database
	[_cardUid, "Main", "Credit", _cardData] call s_stats_write;
	
	// Give physical credit card item
	[_targetPlayer, ["Credit_Card", 1], {[player, (_this select 0), (_this select 1)] call storage_add}, false, false] call network_MPExec;
	
	// Update client
	[_targetPlayer, [_cardData], "credit_update", false, false] call network_MPExec;
	
	// Remove from pending
	credit_pendingCards set [_index, "REMOVE"];
	credit_pendingCards = credit_pendingCards - ["REMOVE"];
	
	[_player, [format ["Credit card approved for %1", name _targetPlayer]], {systemChat _this}, false, false] call network_MPExec;
	[_targetPlayer, ["Your credit card application has been approved by a Cicada Credit Company employee!"], {systemChat _this}, false, false] call network_MPExec;
};

// Refresh employee dialog if open (send updated pending list)
[_player] call S_credit_getPendingApplications;

diag_log formatText ["[CREDIT] Employee %1 approved %2 application (Index: %3)", name _player, _type, _index];
