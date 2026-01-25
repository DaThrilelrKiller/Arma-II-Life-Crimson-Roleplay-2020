// Auto-save police reports periodically
private ["_sleeptime"];

for "_o" from 0 to 1 step 0 do 
{
	_sleeptime = 300; // Save every 5 minutes
	
	// Save police reports
	[] call S_cdb_saveReports;
	
	sleep _sleeptime;
};
