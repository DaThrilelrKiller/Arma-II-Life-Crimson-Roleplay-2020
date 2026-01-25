private["_vehicle"];
_vehicle = _this select 0;
if (isNil "_vehicle") exitWith {false};
not(locked _vehicle)