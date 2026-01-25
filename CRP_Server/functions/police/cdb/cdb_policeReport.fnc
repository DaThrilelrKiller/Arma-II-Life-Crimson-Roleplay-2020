// Create a police report with warrant request option
private ["_suspectName","_reportType","_incidentDetails","_warrantRequested","_warrantReason","_warrantAmount","_types","_type","_suspect","_report","_canIssueWarrant","_sel","_uidFromCombo","_suspectUID"];
_suspectName = ctrlText 5001;
_reportType = lbCurSel 5003;
_incidentDetails = ctrlText 5005;
_warrantRequested = if (isNil "cdb_warrantRequested") then {false} else {cdb_warrantRequested};
_warrantReason = if (_warrantRequested) then {ctrlText 5012} else {""};
_warrantAmount = if (_warrantRequested) then {parseNumber (ctrlText 5006)} else {0};

// Get report type from combo
_types = ["Traffic Violation", "Assault", "Theft", "Drug Offense", "Weapons Violation", "Other"];
_type = if (_reportType >= 0 && _reportType < count _types) then {_types select _reportType} else {"Other"};

_sel = lbCurSel 5014;
_uidFromCombo = "";
if (_sel >= 0) then { _uidFromCombo = lbData [5014, _sel]; };

if (_suspectName == "" && {_uidFromCombo == ""}) exitWith {
	systemChat "Please enter a suspect name.";
};

if (_incidentDetails == "") exitWith {
	systemChat "Please provide incident details.";
};

// Find suspect
_suspect = objNull;
{
	if (name _x == _suspectName) exitWith { _suspect = _x; };
} forEach playableUnits;

// If not found online, allow entering UID directly (offline suspects)
_suspectUID = _uidFromCombo;
if (_suspectUID == "") then {
	_suspectUID = if (isNull _suspect) then {_suspectName} else {getPlayerUID _suspect};
};

// If this is an AI unit (no UID), keep the name and send legacy format so it displays correctly
if (!isNull _suspect && {_suspectUID == ""}) then {
	_report = [
		time,
		name player,
		getPlayerUID player,
		name _suspect,  // suspect name (AI)
		"",             // suspect UID (none)
		_type,
		_incidentDetails,
		_warrantRequested,
		_warrantReason,
		_warrantAmount,
		"pending"
	];
	["SERVER", [_report], "s_cdb_createReport", false, false] call network_MPExec;
	closeDialog 0;
};

// Create compact report payload for server (server resolves suspect name from DB)
// [timestamp, officerName, officerUID, suspectUID, type, details, warrantRequested, warrantReason, warrantAmount]
_report = [
	time,
	name player,
	getPlayerUID player,
	_suspectUID,
	_type,
	_incidentDetails,
	_warrantRequested,
	_warrantReason,
	_warrantAmount
];

// Send report to server (DB-backed)
["SERVER", [_report], "s_cdb_createReport", false, false] call network_MPExec;

// If warrant requested and officer has authority, add warrant directly
if (_warrantRequested) then {
	_canIssueWarrant = false;
	
	// Check if officer has authority to issue warrants (Sergeant and above)
	if (Sgt_id || Cpl_id || Lt_id || Cpt_id || Chief_ID || SwagDevs || adminlevel4 || adminlevel3) then {
		_canIssueWarrant = true;
	};
	
	if (_canIssueWarrant) then {
		// Issue warrant directly (DB-backed, works for offline too)
		["SERVER", [_suspectUID, _warrantReason, _warrantAmount, name player, getPlayerUID player], "s_cdb_addWarrantUID", false, false] call network_MPExec;
		// Report status will be updated by server
		systemChat format ["Warrant issued for %1: %2 ($%3)", if (isNull _suspect) then {_suspectUID} else {name _suspect}, _warrantReason, _warrantAmount];
	} else {
		systemChat "Warrant request submitted for supervisor approval.";
		["ALL", [format["Officer %1 has submitted a warrant request for %2. Review in Police Computer.", name player, if (isNull _suspect) then {_suspectUID} else {name _suspect}]], "network_chat", false, true] call network_MPExec;
	};
} else {
	systemChat format ["Police report filed for %1", if (isNull _suspect) then {_suspectUID} else {name _suspect}];
};

closeDialog 0;
