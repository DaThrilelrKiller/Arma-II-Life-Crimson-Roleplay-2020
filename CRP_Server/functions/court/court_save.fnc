// Save court cases to database
["server", "Court", "Cases", court_cases] call S_stats_write;
["server", "Court", "CaseID", court_caseID] call S_stats_write;

diag_log formatText ["[COURT] Saved %1 cases to database", count court_cases];

true
