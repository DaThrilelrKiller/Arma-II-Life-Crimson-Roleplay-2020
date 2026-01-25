// View all court cases (judge only)
if (!(call court_isJudge)) exitWith {
	systemChat "You are not authorized to view court cases.";
};

if (player distance court_location > 10) exitWith {
	systemChat "You must be at the Cicada Municipal Court to view cases.";
};

createDialog "court_caseList";
