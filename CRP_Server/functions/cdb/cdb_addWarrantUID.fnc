// Server-side: Add warrant for an offline/online player by UID
// Params: [suspectUID, warrantReason, warrantAmount, officerName, officerUID]
private ["_uid","_warrant","_amount","_officerName","_officerUID","_sideArr","_side","_warrants","_unit"];

_uid = _this select 0;
_warrant = _this select 1;
_amount = _this select 2;
_officerName = _this select 3;
_officerUID = _this select 4;

_sideArr = [_uid,"Main","Side",["CIV",0]] call s_stats_read;
_side = "CIV";
if ((typeName _sideArr) == "ARRAY") then {
	if (count _sideArr > 0) then { _side = _sideArr select 0; };
};

_warrants = [_uid,_side,"Warrants",[]] call s_stats_read;
if (isNil "_warrants") then { _warrants = []; };
if ((typeName _warrants) != "ARRAY") then { _warrants = []; };

// Original warrant format in this mission: [reason, amount]
_warrants set [count _warrants, [_warrant,_amount]];

// Persist to database
[_uid,_side,"Warrants",_warrants] call s_stats_write;

// If suspect is online, update their synced variable too
_unit = objNull;
{
	if ((getPlayerUID _x) == _uid) exitWith { _unit = _x; };
} forEach playableUnits;

if (!isNull _unit) then {
	_unit setVariable ["cdb_warrants", _warrants, true];
};

true

