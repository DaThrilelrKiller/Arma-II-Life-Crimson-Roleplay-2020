// Server-side: Update a court case
private ["_caseID","_caseData"];
_caseID = _this select 0;
_caseData = _this select 1;

// Find and update case
{
	if ((_x select 0) == _caseID) then {
		// Update the case
		// Case structure: [caseID, plaintiffName, plaintiffUID, defendantName, defendantUID, charges, status, judgeName, judgeUID, sentence, fine, filedTime, description]
		_x set [6, _caseData select 0]; // status
		_x set [7, _caseData select 1]; // judge name
		_x set [8, _caseData select 2]; // judge UID
		_x set [9, _caseData select 3]; // sentence
		_x set [10, _caseData select 4]; // fine
	};
} forEach court_cases;

// Save to database
[] call S_court_save;

// Sync to all clients
publicVariable "court_cases";

true
