// Approve warrant request from report
private ["_listbox","_selected","_reportIndex","_report","_suspectUID","_suspect","_warrantReason","_warrantAmount"];
_listbox = 6001;
_selected = lbCurSel _listbox;

if (_selected == -1) exitWith {
	systemChat "Please select a report first.";
};

// Judges only (police cannot approve/deny)
if (!(call court_isJudge)) exitWith {
	systemChat "Only a judge can approve warrant requests.";
};

_reportIndex = parseNumber (lbData [_listbox, _selected]);

if (isNil "cdb_policeReports" || _reportIndex >= count cdb_policeReports) exitWith {
	systemChat "Invalid report selected.";
};

_report = cdb_policeReports select _reportIndex;

if (_report select 10 != "pending") exitWith {
	systemChat "This report has already been processed.";
};

if (!(_report select 7)) exitWith {
	systemChat "This report does not have a warrant request.";
};

// Suspect UID (may be offline)
_suspectUID = _report select 4;

// Issue warrant (DB-backed, works offline)
_warrantReason = _report select 8;
_warrantAmount = _report select 9;
["SERVER", [_suspectUID, _warrantReason, _warrantAmount, name player, getPlayerUID player], "s_cdb_addWarrantUID", false, false] call network_MPExec;

// Update report status on server
["SERVER", [_reportIndex, "approved"], "s_cdb_updateReport", false, false] call network_MPExec;

systemChat format ["Warrant approved and issued for %1", _report select 3];
["ALL", [format["Warrant approved by %1 for %2: %3 ($%4)", name player, _report select 3, _warrantReason, _warrantAmount]], "network_chat", false, true] call network_MPExec;

// Refresh report display
[] call cdb_selectReport;
