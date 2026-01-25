// Receive police reports from server
private ["_reports","_targetPlayer"];
_reports = _this select 0;
_targetPlayer = _this select 1;

if (player == _targetPlayer) then {
	cdb_policeReports = _reports;
};
