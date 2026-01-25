// Open dialog to file a court case
if (player distance court_location > 10) exitWith {
	systemChat "You must be at the Cicada Municipal Court to file a case.";
};

if (court_sessionActive) exitWith {
	systemChat "A court session is currently in progress. Please wait.";
};

createDialog "court_fileCase";
