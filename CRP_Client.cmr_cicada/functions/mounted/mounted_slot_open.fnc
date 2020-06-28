private["_vehicle", "_slot_id"];
_vehicle = _this select 0;
_slot_id = _this select 1;

private["_slot_occupant", "_result"];
_slot_occupant = objNull;
_slot_occupant = [_vehicle, _slot_id] call mounted_get_slot_occupant;
_result = (isNull _slot_occupant);
_result