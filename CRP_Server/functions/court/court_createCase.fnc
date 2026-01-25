// Server-side: Create a new court case
private _case = _this select 0;

// Assign case ID
court_caseID = court_caseID + 1;
private _caseID = court_caseID;

// Update case with ID
_case set [0, _caseID];

// Add to cases array
court_cases set [count court_cases, _case];

// Save to database immediately
[] spawn {
	sleep 0.1;
	[] call S_court_save;
};

// Sync to all clients
publicVariable "court_cases";
publicVariable "court_caseID";

diag_log formatText ["[COURT] Case #%1 created: %2 vs %3", _caseID, _case select 1, _case select 3];

true
