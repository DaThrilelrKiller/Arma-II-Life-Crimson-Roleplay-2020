if (dtk_server) exitWith {};

// Sync court cases from server
[] spawn {
	waitUntil {!isNil "court_cases"};
	// Cases are now synced from server
};

// Create court marker
["Court_mrk", court_location, nil, nil, "ColorBlue", "mil_dot", nil, "Cicada Municipal Court"] call core_createMarkerLocal;

// Automatically add judge app to iPad if player is a judge (wait for stats/whitelist to load)
[] spawn {
	waitUntil {!isNil "INVAppsInstalled" && !isNil "AR_Whitelistloaded"};
	if (call court_isJudge) then {
		if (!("app_judge" in INVAppsInstalled)) then {
			INVAppsInstalled set [count INVAppsInstalled, "app_judge"];
		};
	};
};

// Find or create court building object
private ["_courtBuilding"];
_courtBuilding = court_location nearestObject "Land_A_Office01_EP1";
if (isNull _courtBuilding) then {
	// Try to find any building near the location
	_courtBuilding = (nearestObjects [court_location, ["House", "Building"], 50]) select 0;
};

// If we have a building, add actions to it
if (!isNull _courtBuilding) then {
	// Players can file cases
	_courtBuilding addAction ["File Court Case", "noscript.sqf", "[] call court_fileCase", 1, false, true, "", "player distance _target < 10 && !court_sessionActive"];
	
	// Judges can view cases
	_courtBuilding addAction ["View Court Cases", "noscript.sqf", "[] call court_viewCases", 1, false, true, "", "player distance _target < 10 && (call court_isJudge) && !court_sessionActive"];
	
	// Judges can start a hearing
	_courtBuilding addAction ["Start Court Hearing", "noscript.sqf", "[] call court_startHearing", 1, false, true, "", "player distance _target < 10 && (call court_isJudge) && !court_sessionActive && count court_currentCase > 0"];
	
	// Defendants can attend their hearing
	_courtBuilding addAction ["Attend Court Hearing", "noscript.sqf", "[] call court_attendHearing", 1, false, true, "", "player distance _target < 10 && (call court_hasActiveCase) && court_sessionActive"];
} else {
	// Fallback: add actions to player if no building found
	[player, ["File Court Case", "noscript.sqf", "[] call court_fileCase", 1, false, true, "", "player distance court_location < 10 && !court_sessionActive"]] call action_add;
	[player, ["View Court Cases", "noscript.sqf", "[] call court_viewCases", 1, false, true, "", "player distance court_location < 10 && (call court_isJudge) && !court_sessionActive"]] call action_add;
	[player, ["Start Court Hearing", "noscript.sqf", "[] call court_startHearing", 1, false, true, "", "player distance court_location < 10 && (call court_isJudge) && !court_sessionActive && count court_currentCase > 0"]] call action_add;
	[player, ["Attend Court Hearing", "noscript.sqf", "[] call court_attendHearing", 1, false, true, "", "player distance court_location < 10 && (call court_hasActiveCase) && court_sessionActive"]] call action_add;
};
