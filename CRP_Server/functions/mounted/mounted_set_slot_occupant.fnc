private["_vehicle", "_slot_id", "_occupant"];
_vehicle = _this select 0;
_slot_id = _this select 1;
_occupant = _this select 2;

if (isNil "_slot_id") exitWith {};
if (typeName _slot_id != "STRING") exitWith {};
if (isNil "_vehicle") exitWith {};

_occupant = if (isNil "_occupant") then {
objNull
}else{
if (typeName _occupant == "OBJECT") then {
if (isNull _occupant) then { objNull } else { _occupant }
}else{
objNull
}
};


_vehicle setVariable [_slot_id, _occupant, true];
