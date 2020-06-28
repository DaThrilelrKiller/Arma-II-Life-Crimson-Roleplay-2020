private ["_unit","_house"];

_unit = _this select 0;
_house = _this select 1;

["Houses", _house, "Owner",""] call s_stats_write;
["Houses", _house, "Name",""] call s_stats_write;

_house setMarkerAlpha 0;
_house setMarkerText "";