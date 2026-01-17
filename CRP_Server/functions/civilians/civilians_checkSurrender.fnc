private ["_unit","_distance","_nearbyUnits","_armedEnemy","_hasWeapon","_lastShotTime"];

_unit = _this select 0;
_distance = DTK_CIV_SURRENDER_DISTANCE;

/* Check if unit is alive */
if (!alive _unit) exitWith { false };

/* Check for recent gunfire near the unit */
_lastShotTime = _unit getVariable ["dtk_lastShotNear", 0];
if ((time - _lastShotTime) < 5) exitWith { true }; /* If shot within last 5 seconds, trigger surrender */

/* Check for armed enemies nearby */
_nearbyUnits = nearestObjects [_unit, ["Man"], _distance];
_armedEnemy = false;

{
	if (_x != _unit && {alive _x}) then {
		/* Check if unit has any weapon */
		_hasWeapon = (primaryWeapon _x != "" || handgunWeapon _x != "" || secondaryWeapon _x != "");
		
		/* Also check if it's a player (assume players can be armed) */
		if (_hasWeapon || {isPlayer _x}) then {
			_armedEnemy = true;
		};
	};
} forEach _nearbyUnits;

_armedEnemy

