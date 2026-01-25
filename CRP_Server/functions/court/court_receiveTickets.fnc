// Receive persisted tickets from server
private ["_tickets"];
_tickets = _this select 0;

if (isNil "_tickets") then { _tickets = []; };
if ((typeName _tickets) != "ARRAY") then { _tickets = []; };

court_myTickets = _tickets;

// If menu is open, refresh it
if (!isNull (findDisplay 7100)) then {
	[] call court_loadCivMenu;
};

