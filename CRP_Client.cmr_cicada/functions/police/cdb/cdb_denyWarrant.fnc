// Deny warrant request from report
private _listbox = 6001;
private _selected = lbCurSel _listbox;

if (_selected == -1) exitWith {
	systemChat "Please select a report first.";
};

// Check if officer has authority (Sergeant and above)
if (!(Sgt_id || Cpl_id || Lt_id || Cpt_id || Chief_ID || SwagDevs || adminlevel4 || adminlevel3)) exitWith {
	systemChat "You do not have authority to deny warrants.";
};

private _reportIndex = parseNumber (lbData [_listbox, _selected]);

if (isNil "cdb_policeReports" || _reportIndex >= count cdb_policeReports) exitWith {
	systemChat "Invalid report selected.";
};

private _report = cdb_policeReports select _reportIndex;

if (_report select 10 != "pending") exitWith {
	systemChat "This report has already been processed.";
};

// Update report status on server
["ALL", [_reportIndex, "denied"], "cdb_updateReport", false, false] call network_MPExec;

systemChat format ["Warrant request denied for %1", _report select 3];
["ALL", [format["Warrant request denied by %1 for %2", name player, _report select 3]], "network_chat", false, true] call network_MPExec;

// Refresh report display
[] call cdb_selectReport;
