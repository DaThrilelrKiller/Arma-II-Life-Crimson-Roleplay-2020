private["_vehicle", "_class"]; 
_vehicle = _this select 0;

if (isNil "_vehicle") exitwith {[]};
if (isNull _vehicle) exitwith {[]};

_class = (typeOf _vehicle);
private["_entry"];
_entry = [_class] call mounted_lookup_class;
if ((typeName _entry) != "ARRAY") exitwith {[]};

private["_occupants"];
_occupants = [];

{
private["_slot", "_slot_id", "_occupant", "_slod_id"];
_slot = _x;
_slod_id = _slot select mounted_slot_id;
_occupant = [_vehicle, _slod_id] call mounted_get_slot_occupant;
if (!(isNil "_occupant")) then {
if (!(isNull _occupant)) then {
_occupants set[(count _occupants), _occupant];
};
};
} forEach (_entry select mounted_slots);

_occupants