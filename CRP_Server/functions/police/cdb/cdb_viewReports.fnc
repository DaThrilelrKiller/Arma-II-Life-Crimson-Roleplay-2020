// View all police reports
// Request reports from server
["SERVER", [player], "s_cdb_syncReports", false, false] call network_MPExec;

// Wait a moment for sync
sleep 0.1;

createDialog "cdb_reportsList";
