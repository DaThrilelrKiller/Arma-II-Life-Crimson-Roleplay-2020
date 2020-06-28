private["_class", "_slot_anme","_slot_id"];
_class = _this select 0;
_slot_id = _this select 1;

private["_entry"];
_entry = [_class] call mounted_lookup_class;
if (isNil "_entry") exitWith {""};
if ((typeName _entry) != "ARRAY") exitwith {""};

if (isNil "_slot_id") exitWith {""};
if (typeName _slot_id != "STRING") exitWith {""};

private["_slot_entry"];
_slot_entry = "";

{
private["_cslot_entry", "_cslot_name"];
_cslot_entry = _x;
_cslot_name = _cslot_entry select mounted_slot_id;
if (_cslot_name == _slot_id) exitWith {
_slot_entry = _cslot_entry;
};
} forEach (_entry select mounted_slots);

_slot_entry