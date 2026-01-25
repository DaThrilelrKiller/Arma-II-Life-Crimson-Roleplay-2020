// End court hearing without verdict (dismiss case, etc.)
if (!(call court_isJudge)) exitWith {
	systemChat "You are not authorized to end hearings.";
};

if (!court_sessionActive) exitWith {
	systemChat "No court session is active.";
};

if (player != court_currentJudge) exitWith {
	systemChat "You are not the presiding judge for this case.";
};

private _caseID = court_currentCase select 0;

// Update case status to dismissed on server
["ALL", [_caseID, ["dismissed", name player, getPlayerUID player, 0, 0]], "court_updateCase", false, false] call network_MPExec;

["ALL", [format["Case #%1 has been dismissed by the judge.", _caseID]], "network_chat", false, true] call network_MPExec;

// End session
court_sessionActive = false;
court_currentJudge = objNull;
court_currentDefendant = objNull;
court_currentPlaintiff = objNull;
court_currentCase = [];

closeDialog 0;
