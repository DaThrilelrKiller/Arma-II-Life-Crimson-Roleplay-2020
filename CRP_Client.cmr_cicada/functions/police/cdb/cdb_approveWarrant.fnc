// Approve warrant request from report
private ["_listbox","_selected","_reportIndex","_report","_suspectUID","_suspect","_warrantReason","_warrantAmount"];
_listbox = 6001;
_selected = lbCurSel _listbox;

if (_selected == -1) exitWith {
	systemChat "Please select a report first.";
};

// Check if officer has authority (Sergeant and above)
if (!(Sgt_id || Cpl_id || Lt_id || Cpt_id || Chief_ID || SwagDevs || adminlevel4 || adminlevel3)) exitWith {
	systemChat "You do not have authority to approve warrants.";
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

// Find suspect
_suspectUID = _report select 4;
_suspect = objNull;
{
	if (getPlayerUID _x == _suspectUID) then {
		_suspect = _x;
	};
} forEach playableUnits;

if (isNull _suspect) exitWith {
	systemChat "Suspect is not online. Warrant will be issued when they connect.";
	// Still approve the report
	["ALL", [_reportIndex, "approved"], "cdb_updateReport", false, false] call network_MPExec;
	// Refresh report display
	[] call cdb_selectReport;
};

// Issue warrant
_warrantReason = _report select 8;
_warrantAmount = _report select 9;
[_suspect, _warrantReason, _warrantAmount] call cdb_addWarrant;

// Update report status on server
["ALL", [_reportIndex, "approved"], "cdb_updateReport", false, false] call network_MPExec;

systemChat format ["Warrant approved and issued for %1", _report select 3];
["ALL", [format["Warrant approved by %1 for %2: %3 ($%4)", name player, _report select 3, _warrantReason, _warrantAmount]], "network_chat", false, true] call network_MPExec;

// Refresh report display
[] call cdb_selectReport;
