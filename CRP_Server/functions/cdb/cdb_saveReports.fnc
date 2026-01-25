// Save police reports to database
["server", "CDB", "PoliceReports", cdb_policeReports] call S_stats_write;

diag_log formatText ["[CDB] Saved %1 police reports to database", count cdb_policeReports];

true
