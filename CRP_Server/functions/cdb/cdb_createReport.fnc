// Server-side: Create a new police report
// Accepts either:
//  - full report array (legacy): [timestamp, officerName, officerUID, suspectName, suspectUID, type, details, warrantRequested, warrantReason, warrantAmount, status]
//  - compact params: [timestamp, officerName, officerUID, suspectUID, type, details, warrantRequested, warrantReason, warrantAmount]
private ["_in","_report","_suspectUID","_suspectName"];

_in = _this select 0;
_report = [];

if ((typeName _in) == "ARRAY" && {count _in >= 11}) then {
	// Legacy full report
	_report = _in;
} else {
	// Compact format (preferred)
	// [timestamp, officerName, officerUID, suspectUID, type, details, warrantRequested, warrantReason, warrantAmount]
	_suspectUID = _in select 3;
	_suspectName = [_suspectUID] call S_cdb_getNameByUID;
	if (_suspectName == "") then { _suspectName = format ["UID:%1", _suspectUID]; };

	_report = [
		_in select 0, // timestamp
		_in select 1, // officer name
		_in select 2, // officer UID
		_suspectName, // suspect name (from DB)
		_suspectUID,  // suspect UID
		_in select 4, // report type
		_in select 5, // details
		_in select 6, // warrant requested
		_in select 7, // warrant reason
		_in select 8, // warrant amount
		"pending"     // status
	];
};

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
