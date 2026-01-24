// Check if player is a credit company employee
// Uses the whitelist system with ccc_id variable
private ["_player","_isEmployee"];

_player = _this select 0;

// Check if player has ccc_id whitelist variable
_isEmployee = missionNamespace getVariable ["ccc_id", false];

// Send result to client
[_player, [_isEmployee], "credit_employee_check", false, false] call network_MPExec;

_isEmployee
