private["_vehicle", "_slot_id"];
_vehicle = _this select 0;
_slot_id = _this select 1;

if (isNil "_slot_id") exitWith {objNull};
if (typeName _slot_id != "STRING") exitWith {objNull};
if (isNil "_vehicle") exitWith {objNull};

private["_occupant"];
_occupant = objNull;
_occupant = _vehicle getVariable [_slot_id, objNull];

if (isNil "_occupant") exitwith {objNull};
if (isNull _occupant) then {objNull}else{_occupant}