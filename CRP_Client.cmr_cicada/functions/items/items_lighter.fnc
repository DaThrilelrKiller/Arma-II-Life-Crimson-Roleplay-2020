private ["_object","_CarFire","_fuel"];

_object = cursorTarget;
_CarFire = false;

if (isNull _object ||{!([_object,["Air", "Ship", "LandVehicle","Tank"]]call core_isKindOf)})then {
	_object = nearestObjects [getPos player, ['House'], 20]select 0;
}else{
	_CarFire = true;
	_object setDamage 0.9;
	_object setHit ["wheel_1_1_steering", 1];
	_object setHit ["wheel_2_1_steering", 1];
	_object setHit ["wheel_1_2_steering", 1];
	_object setHit ["wheel_2_2_steering", 1];
};

_fuel = nearestObjects [getPos player, ['Fuel_can'], 20];
if (count _fuel < 3 && {!_CarFire})exitWith {
	systemchat "You need to place more accelerant on the ground!";
};

if (isNil "_object" || {isNull _object})exitWith {
	systemchat "Nothing found in range to burn!";
};

["SERVER",_object,"s_ems_fire",false,false]call network_MPExec;