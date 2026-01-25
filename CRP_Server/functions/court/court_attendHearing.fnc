// Defendant attends their hearing
private ["_playerUID","_defendantUID"];
if (!court_sessionActive) exitWith {
	systemChat "No court session is currently active.";
};

_playerUID = getPlayerUID player;

// Get defendant UID from current case
_defendantUID = "";
if (count court_currentCase > 4) then {
	_defendantUID = court_currentCase select 4;
};

if (_playerUID != _defendantUID) exitWith {
	systemChat "This hearing is not for you.";
};

if (player distance court_location > 50) exitWith {
	systemChat "You must be at the court to attend the hearing.";
};

// Open hearing dialog for defendant
createDialog "court_hearing_defendant";
