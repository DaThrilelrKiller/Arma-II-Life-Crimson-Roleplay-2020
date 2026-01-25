// Create a police report with warrant request option
private ["_suspectName","_reportType","_incidentDetails","_warrantRequested","_warrantReason","_warrantAmount","_types","_type","_suspect","_report","_canIssueWarrant"];
_suspectName = ctrlText 5001;
_reportType = lbCurSel 5003;
_incidentDetails = ctrlText 5005;
_warrantRequested = if (isNil "cdb_warrantRequested") then {false} else {cdb_warrantRequested};
_warrantReason = if (_warrantRequested) then {ctrlText 5012} else {""};
_warrantAmount = if (_warrantRequested) then {parseNumber (ctrlText 5006)} else {0};

// Get report type from combo
_types = ["Traffic Violation", "Assault", "Theft", "Drug Offense", "Weapons Violation", "Other"];
_type = if (_reportType >= 0 && _reportType < count _types) then {_types select _reportType} else {"Other"};

if (_suspectName == "") exitWith {
	systemChat "Please enter a suspect name.";
};

if (_incidentDetails == "") exitWith {
	systemChat "Please provide incident details.";
};

// Find suspect
_suspect = objNull;
{
	if (name _x == _suspectName) then {
		_suspect = _x;
	};
} forEach playableUnits;

if (isNull _suspect) exitWith {
	systemChat format ["Suspect '%1' not found. Make sure they are online.", _suspectName];
};


// Create report
_report = [
	time, // timestamp
	name player, // officer name
	getPlayerUID player, // officer UID
	name _suspect, // suspect name
	getPlayerUID _suspect, // suspect UID
	_type, // report type
	_incidentDetails, // details
	_warrantRequested, // warrant requested
	_warrantReason, // warrant reason
	_warrantAmount, // warrant amount
	"pending" // status
];

// Send report to server
["ALL", [_report], "cdb_createReport", false, false] call network_MPExec;

// If warrant requested and officer has authority, add warrant directly
if (_warrantRequested) then {
	_canIssueWarrant = false;
	
	// Check if officer has authority to issue warrants (Sergeant and above)
	if (Sgt_id || Cpl_id || Lt_id || Cpt_id || Chief_ID || SwagDevs || adminlevel4 || adminlevel3) then {
		_canIssueWarrant = true;
	};
	
	if (_canIssueWarrant) then {
		// Issue warrant directly
		[_suspect, _warrantReason, _warrantAmount] call cdb_addWarrant;
		// Report status will be updated by server
		systemChat format ["Warrant issued for %1: %2 ($%3)", name _suspect, _warrantReason, _warrantAmount];
	} else {
		systemChat "Warrant request submitted for supervisor approval.";
		["ALL", [format["Officer %1 has submitted a warrant request for %2. Review in Police Computer.", name player, name _suspect]], "network_chat", false, true] call network_MPExec;
	};
} else {
	systemChat format ["Police report filed for %1", name _suspect];
};

closeDialog 0;
