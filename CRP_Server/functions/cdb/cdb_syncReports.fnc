// Sync police reports to client
private ["_player"];
_player = _this select 0;

["ALL", [cdb_policeReports, _player], "cdb_receiveReports", false, false] call network_MPExec;

true
