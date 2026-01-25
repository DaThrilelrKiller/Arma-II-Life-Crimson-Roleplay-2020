// Server-side: Clear warrants for an offline/online player by UID
// Params: [suspectUID]
private ["_uid","_sideArr","_side","_unit"];

_uid = _this select 0;
if (isNil "_uid" || {_uid == ""}) exitWith {false};

_sideArr = [_uid,"Main","Side",["CIV",0]] call s_stats_read;
_side = "CIV";
if ((typeName _sideArr) == "ARRAY") then {
	if (count _sideArr > 0) then { _side = _sideArr select 0; };
};

// Persist empty warrants list
[_uid,_side,"Warrants",[]] call s_stats_write;

// If suspect is online, update their synced variable too
_unit = objNull;
{
	if ((getPlayerUID _x) == _uid) exitWith { _unit = _x; };
} forEach playableUnits;

if (!isNull _unit) then {
	_unit setVariable ["cdb_warrants", [], true];
};

true

