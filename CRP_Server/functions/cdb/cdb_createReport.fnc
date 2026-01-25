// Server-side: Create a new police report
private _report = _this select 0;

// Add to reports array
cdb_policeReports set [count cdb_policeReports, _report];

// Save to database immediately
[] spawn {
	sleep 0.1;
	[] call S_cdb_saveReports;
};

// Sync to all clients
publicVariable "cdb_policeReports";

diag_log formatText ["[CDB] Police report created: %1 vs %2", _report select 1, _report select 3];

true
