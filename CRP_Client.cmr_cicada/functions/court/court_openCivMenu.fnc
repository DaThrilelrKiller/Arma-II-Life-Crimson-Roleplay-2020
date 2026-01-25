// Civ court services menu (tickets / warrants / court dates)
if (player distance court_location > 10) exitWith {
	systemChat "You must be at the Cicada Municipal Court to use court services.";
};

createDialog "court_civMenu";
[] call court_loadCivMenu;

// Refresh tickets from server (persisted)
["SERVER", [player], "S_Court_getTickets", false, false] call network_MPExec;

