private ["_unit","_distance","_nearbyUnits","_armedEnemy","_hasWeapon","_lastShotTime"];

_unit = _this select 0;
_distance = DTK_CIV_SURRENDER_DISTANCE;

/* Check if unit is alive */
if (!alive _unit) exitWith { 
	[civ47,["true",format ["checkSurrender: Unit %1 is not alive", name _unit],3],"network_chat",false,false] call network_MPExec;
	false 
};

/* Check for recent gunfire near the unit */
_lastShotTime = _unit getVariable ["dtk_lastShotNear", 0];
[civ47,["true",format ["checkSurrender: Unit %1 - lastShotTime: %2, time since: %3", name _unit, _lastShotTime, (time - _lastShotTime)],3],"network_chat",false,false] call network_MPExec;
if ((time - _lastShotTime) < 5) exitWith { 
	[civ47,["true",format ["checkSurrender: Unit %1 - Gunfire detected! Returning TRUE (time since shot: %2 < 5)", name _unit, (time - _lastShotTime)],3],"network_chat",false,false] call network_MPExec;
	true 
}; /* If shot within last 5 seconds, trigger surrender */

/* Check for armed enemies nearby */
_nearbyUnits = nearestObjects [_unit, ["Man"], _distance];
[civ47,["true",format ["checkSurrender: Unit %1 - Checking nearby units within %2m. Found %3 units", name _unit, _distance, count _nearbyUnits],3],"network_chat",false,false] call network_MPExec;
_armedEnemy = false;

{
	if (_x != _unit && {alive _x}) then {
		/* Check if unit has any weapon */
		_hasWeapon = (primaryWeapon _x != "" || handgunWeapon _x != "" || secondaryWeapon _x != "");
		_isPlayer = isPlayer _x;
		
		[civ47,["true",format ["checkSurrender: Unit %1 - Checking %2 (distance: %3m, hasWeapon: %4, isPlayer: %5, primary: '%6', handgun: '%7', secondary: '%8')", name _unit, name _x, _unit distance _x, _hasWeapon, _isPlayer, primaryWeapon _x, handgunWeapon _x, secondaryWeapon _x],3],"network_chat",false,false] call network_MPExec;
		
		/* Also check if it's a player (assume players can be armed) */
		if (_hasWeapon || {_isPlayer}) then {
			_armedEnemy = true;
			[civ47,["true",format ["checkSurrender: Unit %1 - ARMED ENEMY DETECTED: %2 (hasWeapon: %3, isPlayer: %4)", name _unit, name _x, _hasWeapon, _isPlayer],3],"network_chat",false,false] call network_MPExec;
		};
	};
} forEach _nearbyUnits;

[civ47,["true",format ["checkSurrender: Unit %1 - Final result: %2 (armedEnemy: %3)", name _unit, _armedEnemy, _armedEnemy],3],"network_chat",false,false] call network_MPExec;
_armedEnemy

