/*
 * Debug Console Commands for Civilian Surrender System
 * 
 * Copy and paste these commands into your server console or RPT log
 */

// 1. Check if variables are defined
diag_log format ["[DEBUG] DTK_CIV_SURRENDER_ENABLED: %1 | DISTANCE: %2 | SHOT_RADIUS: %3 | DURATION: %4 | CHECK_INTERVAL: %5", 
	DTK_CIV_SURRENDER_ENABLED, 
	DTK_CIV_SURRENDER_DISTANCE, 
	DTK_CIV_SURRENDER_SHOT_RADIUS, 
	DTK_CIV_SURRENDER_DURATION, 
	DTK_CIV_SURRENDER_CHECK_INTERVAL
];
[civ47,["true",format ["[DEBUG] Variables - ENABLED: %1 | DIST: %2m | SHOT_RAD: %3m | DUR: %4s | INTERVAL: %5s", 
	DTK_CIV_SURRENDER_ENABLED, DTK_CIV_SURRENDER_DISTANCE, DTK_CIV_SURRENDER_SHOT_RADIUS, DTK_CIV_SURRENDER_DURATION, DTK_CIV_SURRENDER_CHECK_INTERVAL],3],"network_chat",false,false] call network_MPExec;

// 2. Count civilian units
_civCount = {side _x == civilian && {alive _x}} count allUnits;
diag_log format ["[SURRENDER DEBUG] Total civilian units alive: %1", _civCount];
[civ47,["true",format ["[DEBUG] Total civilian units alive: %1", _civCount],3],"network_chat",false,false] call network_MPExec;

// 3. List all civilian units and their surrender state
{
	if (side _x == civilian && {alive _x}) then {
		_state = _x getVariable ["dtk_surrender_state", "NOT SET"];
		_hasHandler = if (isNil {_x getVariable "dtk_surrender_handler"}) then {"NO"} else {"YES"};
		_lastShot = _x getVariable ["dtk_lastShotNear", 0];
		_surrendered = _x getVariable ["dtk_surrendered", false];
		
		diag_log format ["[SURRENDER DEBUG] Civ: %1 | State: %2 | Handler: %3 | LastShot: %4 | Surrendered: %5", 
			name _x, _state, _hasHandler, _lastShot, _surrendered];
		
	};
} forEach allUnits;

// 4. Test if civ47 exists
if (isNil "civ47") then {
	diag_log "[SURRENDER DEBUG] ERROR: civ47 is nil! Messages won't work.";
} else {
	diag_log format ["[SURRENDER DEBUG] civ47 exists: %1", civ47];
	[civ47,["true",format ["[DEBUG] civ47 exists and messages are working"],3],"network_chat",false,false] call network_MPExec;
};

// 5. Test network_MPExec with a simple message
[civ47,["true",format ["[DEBUG TEST] This is a test message at time %1", time],3],"network_chat",false,false] call network_MPExec;
diag_log "[SURRENDER DEBUG] Sent test message to civ47";

// 6. Manually trigger checkSurrender on nearest civilian (server-side - finds nearest to any player or first civilian)
_nearestCiv = objNull;
_nearestDist = 9999;
_refPos = [0,0,0];
if (count playableUnits > 0) then {
	_refPos = position (playableUnits select 0);
};

{
	if (side _x == civilian && {alive _x} && {!isPlayer _x}) then {
		_dist = _refPos distance _x;
		if (_dist < _nearestDist) then {
			_nearestDist = _dist;
			_nearestCiv = _x;
		};
	};
} forEach allUnits;

if (!isNull _nearestCiv) then {
	diag_log format ["[SURRENDER DEBUG] Testing checkSurrender on civilian: %1 (distance: %2m)", name _nearestCiv, _nearestDist];
	_result = [_nearestCiv] call s_civilians_checkSurrender;
	diag_log format ["[SURRENDER DEBUG] checkSurrender returned type: %1, value: %2", typeName _result, _result];
	
	if (isNil "_result") then {
		diag_log "[SURRENDER DEBUG] ERROR: checkSurrender returned nil!";
		[civ47,["true",format ["[DEBUG] ERROR: checkSurrender on %1 returned NULL/NIL", name _nearestCiv],3],"network_chat",false,false] call network_MPExec;
	} else {
		diag_log format ["[SURRENDER DEBUG] Manual checkSurrender on %1 (dist: %2m from player area): %3", name _nearestCiv, _nearestDist, _result];
		[civ47,["true",format ["[DEBUG] checkSurrender on %1: %2 (dist: %3m, type: %4)", name _nearestCiv, _result, _nearestDist, typeName _result],3],"network_chat",false,false] call network_MPExec;
	};
} else {
	diag_log "[SURRENDER DEBUG] No civilian found";
	[civ47,["true","[DEBUG] No civilian found to test",3],"network_chat",false,false] call network_MPExec;
};

// 7. Check if surrender handler function exists
if (isNil "s_civilians_surrenderHandler") then {
	diag_log "[SURRENDER DEBUG] ERROR: s_civilians_surrenderHandler function not found!";
	[civ47,["true","[DEBUG] ERROR: s_civilians_surrenderHandler function not found!",3],"network_chat",false,false] call network_MPExec;
} else {
	diag_log "[SURRENDER DEBUG] s_civilians_surrenderHandler function exists";
	[civ47,["true","[DEBUG] s_civilians_surrenderHandler function exists",3],"network_chat",false,false] call network_MPExec;
};

// 8. Check if checkSurrender function exists
if (isNil "s_civilians_checkSurrender") then {
	diag_log "[SURRENDER DEBUG] ERROR: s_civilians_checkSurrender function not found!";
	[civ47,["true","[DEBUG] ERROR: s_civilians_checkSurrender function not found!",3],"network_chat",false,false] call network_MPExec;
} else {
	diag_log "[SURRENDER DEBUG] s_civilians_checkSurrender function exists";
	[civ47,["true","[DEBUG] s_civilians_checkSurrender function exists",3],"network_chat",false,false] call network_MPExec;
};

diag_log "[SURRENDER DEBUG] ===== Debug check complete =====";

