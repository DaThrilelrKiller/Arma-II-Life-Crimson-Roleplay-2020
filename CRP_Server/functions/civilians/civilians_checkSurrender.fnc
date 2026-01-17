private ["_unit","_distance","_nearbyUnits","_armedEnemy","_hasWeapon","_lastShotTime","_result"];

_unit = _this select 0;
_distance = DTK_CIV_SURRENDER_DISTANCE;
_armedEnemy = false;
_result = false;

if (!alive _unit) exitWith { 
	false 
};

_lastShotTime = _unit getVariable ["dtk_lastShotNear", 0];
if ((time - _lastShotTime) < 5) exitWith { 
	true 
}; 

_nearbyUnits = nearestObjects [_unit, ["Man"], _distance];
_armedEnemy = false;

{
	if (_x != _unit && {alive _x}) then {
		_hasWeapon = (primaryWeapon _x != "" || secondaryWeapon _x != "");
		_isPlayer = isPlayer _x;
		_unitSide = side _x;
		_civSide = side _unit;
				
		if (_hasWeapon) then {
			if (_isPlayer || {_unitSide != _civSide}) then {
				_armedEnemy = true;
			};
		};
	};
} forEach _nearbyUnits;

_result = _armedEnemy;
if (isNil "_result" || {typeName _result != "BOOL"}) then {
	_result = false;
};
_result