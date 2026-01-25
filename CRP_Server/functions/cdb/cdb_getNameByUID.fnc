// Server-side: Resolve player name from UID (IniDBI)
private ["_uid","_name"];
_uid = _this select 0;

_name = [_uid,"Main","NAME",""] call s_stats_read;
if (isNil "_name") then { _name = ""; };

_name

