// Load court cases from database
court_cases = ["server", "Court", "Cases", []] call S_stats_read;
court_caseID = ["server", "Court", "CaseID", 0] call S_stats_read;

// Validate and clean up cases (remove references to offline players)
private _validCases = [];
{
	private _case = _x;
	if (count _case >= 10) then {
		// Keep the case structure but note that player objects won't persist
		_validCases set [count _validCases, _case];
	};
} forEach court_cases;

court_cases = _validCases;

// Make cases public for clients
publicVariable "court_cases";
publicVariable "court_caseID";

// Start auto-save loop
[] spawn S_court_loop;

diag_log formatText ["[COURT] Loaded %1 cases from database. Next Case ID: %2", count court_cases, court_caseID];
