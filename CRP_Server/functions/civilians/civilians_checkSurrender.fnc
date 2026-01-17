private ["_unit","_distance","_nearbyUnits","_armedEnemy","_hasWeapon","_lastShotTime","_result"];

_unit = _this select 0;
_distance = DTK_CIV_SURRENDER_DISTANCE;
_armedEnemy = false;
_result = false;

if (!alive _unit) exitWith { 
	[civ47,["true",format ["checkSurrender: Unit %1 is not alive", name _unit],3],"network_chat",false,false] call network_MPExec;
	false 
};

_lastShotTime = _unit getVariable ["dtk_lastShotNear", 0];
[civ47,["true",format ["checkSurrender: Unit %1 - lastShotTime: %2, time since: %3", name _unit, _lastShotTime, (time - _lastShotTime)],3],"network_chat",false,false] call network_MPExec;
if ((time - _lastShotTime) < 5) exitWith { 
	[civ47,["true",format ["checkSurrender: Unit %1 - Gunfire detected! Returning TRUE (time since shot: %2 < 5)", name _unit, (time - _lastShotTime)],3],"network_chat",false,false] call network_MPExec;
	true 
}; 

_nearbyUnits = nearestObjects [_unit, ["Man"], _distance];
[civ47,["true",format ["checkSurrender: Unit %1 - Checking nearby units within %2m. Found %3 units", name _unit, _distance, count _nearbyUnits],3],"network_chat",false,false] call network_MPExec;
_armedEnemy = false;

{
	if (_x != _unit && {alive _x}) then {
		_hasWeapon = (primaryWeapon _x != "" || handgunWeapon _x != "" || secondaryWeapon _x != "");
		_isPlayer = isPlayer _x;
		_unitSide = side _x;
		_civSide = side _unit;
		
		[civ47,["true",format ["checkSurrender: Unit %1 - Checking %2 (distance: %3m, hasWeapon: %4, isPlayer: %5, side: %6, primary: '%7', handgun: '%8', secondary: '%9')", name _unit, name _x, _unit distance _x, _hasWeapon, _isPlayer, _unitSide, primaryWeapon _x, handgunWeapon _x, secondaryWeapon _x],3],"network_chat",false,false] call network_MPExec;
		
		if (_hasWeapon) then {
			if (_isPlayer || {_unitSide != _civSide}) then {
				_armedEnemy = true;
				[civ47,["true",format ["checkSurrender: Unit %1 - ARMED ENEMY DETECTED: %2 (hasWeapon: %3, isPlayer: %4, side: %5)", name _unit, name _x, _hasWeapon, _isPlayer, _unitSide],3],"network_chat",false,false] call network_MPExec;
			};
		};
	};
} forEach _nearbyUnits;

_result = _armedEnemy;
[civ47,["true",format ["checkSurrender: Unit %1 - Final result: %2 (armedEnemy: %3)", name _unit, _result, _armedEnemy],3],"network_chat",false,false] call network_MPExec;
diag_log format ["[checkSurrender] Unit %1 - Returning: %2 (type: %3)", name _unit, _result, typeName _result];
if (isNil "_result" || {typeName _result != "BOOL"}) then {
	diag_log format ["[checkSurrender] ERROR: _result is not boolean! Value: %1, Type: %2. Defaulting to false", _result, typeName _result];
	_result = false;
};
_result
