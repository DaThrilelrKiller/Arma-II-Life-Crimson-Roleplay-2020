// Auto-save court cases periodically
private ["_sleeptime"];

for "_o" from 0 to 1 step 0 do 
{
	_sleeptime = 300; // Save every 5 minutes
	
	// Save court cases
	[] call S_court_save;
	
	sleep _sleeptime;
};
