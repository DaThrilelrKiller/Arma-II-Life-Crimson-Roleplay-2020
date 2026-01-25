// Deny warrant request from report
private ["_listbox","_selected","_reportIndex","_report"];
_listbox = 6001;
_selected = lbCurSel _listbox;

if (_selected == -1) exitWith {
	systemChat "Please select a report first.";
};

// Judges only (police cannot approve/deny)
if (!(call court_isJudge)) exitWith {
	systemChat "Only a judge can deny warrant requests.";
};

_reportIndex = parseNumber (lbData [_listbox, _selected]);

if (isNil "cdb_policeReports" || _reportIndex >= count cdb_policeReports) exitWith {
	systemChat "Invalid report selected.";
};

_report = cdb_policeReports select _reportIndex;

if (_report select 10 != "pending") exitWith {
	systemChat "This report has already been processed.";
};

// Update report status on server
["SERVER", [_reportIndex, "denied"], "s_cdb_updateReport", false, false] call network_MPExec;

systemChat format ["Warrant request denied for %1", _report select 3];
["ALL", [format["Warrant request denied by %1 for %2", name player, _report select 3]], "network_chat", false, true] call network_MPExec;

// Refresh report display
[] call cdb_selectReport;
