// View all police reports
// Request reports from server
["ALL", [player], "cdb_syncReports", false, false] call network_MPExec;

// Wait a moment for sync
sleep 0.1;

createDialog "cdb_reportsList";
