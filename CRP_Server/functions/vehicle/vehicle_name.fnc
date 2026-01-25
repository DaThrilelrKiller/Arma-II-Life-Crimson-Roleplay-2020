private ["_data","_name"];

_data = (_this getVariable "DTK_OwnerUID" select 1);
if (isNil "_data")exitWith {typeOf _this};

_name = _data call config_displayname;
_name
