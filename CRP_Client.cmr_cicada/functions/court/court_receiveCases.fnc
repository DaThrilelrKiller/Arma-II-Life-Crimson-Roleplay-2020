// Receive court cases from server
private _cases = _this select 0;
private _targetPlayer = _this select 1;

if (player == _targetPlayer) then {
	court_cases = _cases;
};
