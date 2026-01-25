// Load police reports from database
cdb_policeReports = ["server", "CDB", "PoliceReports", []] call S_stats_read;

// Make reports public for clients
publicVariable "cdb_policeReports";

// Start auto-save loop
[] spawn S_cdb_loop;

diag_log formatText ["[CDB] Loaded %1 police reports from database", count cdb_policeReports];
