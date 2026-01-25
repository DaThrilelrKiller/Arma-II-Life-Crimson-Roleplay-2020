// Start a court hearing for the selected case
if (!(call court_isJudge)) exitWith {
	systemChat "You are not authorized to start court hearings.";
};

if (count court_currentCase == 0) exitWith {
	systemChat "Please select a case first.";
};

private _status = court_currentCase select 6;
if (_status != "pending" && _status != "scheduled") exitWith {
	systemChat "This case cannot be started. Status: " + _status;
};

private _defendantName = court_currentCase select 3;
private _plaintiffName = court_currentCase select 1;
private _defendantUID = court_currentCase select 4;
private _plaintiffUID = court_currentCase select 2;

// Find players by UID
private _defendant = objNull;
private _plaintiff = objNull;
{
	if (getPlayerUID _x == _defendantUID) then {
		_defendant = _x;
	};
	if (getPlayerUID _x == _plaintiffUID) then {
		_plaintiff = _x;
	};
} forEach playableUnits;

// Check if parties are present
if (isNull _defendant || isNull _plaintiff) exitWith {
	systemChat "Both parties must be present to start the hearing.";
};

if (!alive _defendant || !alive _plaintiff) exitWith {
	systemChat "Both parties must be alive to start the hearing.";
};

if (_defendant distance court_location > 50 || _plaintiff distance court_location > 50) exitWith {
	systemChat "Both parties must be near the court to start the hearing.";
};

// Start the hearing
court_sessionActive = true;
court_currentJudge = player;
court_currentDefendant = _defendant;
court_currentPlaintiff = _plaintiff;

// Update current case reference
court_currentCase = _selectedCase;

// Update case status on server
private _caseID = court_currentCase select 0;
["ALL", [_caseID, ["in_session", name player, getPlayerUID player, 0, 0]], "court_updateCase", false, false] call network_MPExec;

// Notify parties
["ALL", [format["Court hearing for Case #%1 has begun. All parties please proceed to the courtroom.", _caseID]], "network_chat", false, true] call network_MPExec;

// Open hearing dialog
createDialog "court_hearing";
