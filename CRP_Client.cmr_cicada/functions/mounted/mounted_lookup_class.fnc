private["_class"];
_class = _this select 0;
if (isNil "_class") exitWith {};
if (typeName _class != "STRING") exitWith {};

private["_entry"];
_entry = "";

{
private["_centry", "_cclass", "_cslot_name", "_clots"];
_centry = _x;
_cclass = _centry select mounted_classes;
if (_class in (_cclass) ) exitWith {
_entry = _centry;
};
} forEach mounted_vehicle_slots;

_entry