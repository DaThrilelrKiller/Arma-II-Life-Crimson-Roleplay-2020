// Submit application for employee review (when credit score is too low)
private ["_player","_type","_amount","_interestRate","_score","_uid","_name","_application"];

_player = _this select 0;
_type = _this select 1; // "loan" or "card"
_amount = _this select 2;
_interestRate = _this select 3;
_score = _this select 4;
_uid = getPlayerUID _player;
_name = name _player;

_application = [_uid, [_type, _amount, _interestRate, _score, _name, time]];

if (_type == "loan") then {
	credit_pendingLoans set [count credit_pendingLoans, _application];
	[_player, ["Your loan application has been submitted for review by a Cicada Credit Company employee."], {systemChat _this}, false, false] call network_MPExec;
} else {
	credit_pendingCards set [count credit_pendingCards, _application];
	[_player, ["Your credit card application has been submitted for review by a Cicada Credit Company employee."], {systemChat _this}, false, false] call network_MPExec;
};

// Notify all employees (using ccc_id whitelist)
{
	if (missionNamespace getVariable ["ccc_id", false]) then {
		[_x, [format ["New %1 application from %2 (Score: %3)", _type, _name, _score]], {systemChat _this}, false, false] call network_MPExec;
	};
}forEach allPlayers;

diag_log formatText ["[CREDIT] Application submitted - Type: %1, Player: %2 (UID: %3), Score: %4", _type, _name, _uid, _score];

true
