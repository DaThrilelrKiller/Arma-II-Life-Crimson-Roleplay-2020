// Server-side: Update a police report
private _reportIndex = _this select 0;
private _status = _this select 1;

if (_reportIndex >= count cdb_policeReports) exitWith {false};

private _report = cdb_policeReports select _reportIndex;
_report set [10, _status]; // Update status

// Save to database
[] call S_cdb_saveReports;

// Sync to all clients
publicVariable "cdb_policeReports";

true
