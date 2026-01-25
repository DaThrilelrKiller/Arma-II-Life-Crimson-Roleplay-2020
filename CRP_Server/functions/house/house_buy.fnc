private ["_unit","_house"];

_unit = _this select 0;
_house = _this select 1;

["Houses", _house, "Owner", getPlayerUID _unit] call s_stats_write;
["Houses", _house, "Name", name _unit] call s_stats_write;

_house setMarkerAlpha 1;
_house setMarkerText format ["%1's House", name _unit];