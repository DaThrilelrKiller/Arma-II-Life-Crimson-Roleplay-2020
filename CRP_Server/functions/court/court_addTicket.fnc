// Server-side: Add a persisted ticket to a player (works offline)
// Params: [suspectUID, reason, amount, officerName, officerUID]
private ["_uid","_reason","_amount","_officerName","_officerUID","_sideArr","_side","_tickets","_ticket","_unit"];

_uid = _this select 0;
_reason = _this select 1;
_amount = _this select 2;
_officerName = _this select 3;
_officerUID = _this select 4;

if (isNil "_uid" || {_uid == ""}) exitWith {false};

_sideArr = [_uid,"Main","Side",["CIV",0]] call s_stats_read;
_side = "CIV";
if ((typeName _sideArr) == "ARRAY") then {
	if (count _sideArr > 0) then { _side = _sideArr select 0; };
};

_tickets = [_uid,_side,"Tickets",[]] call s_stats_read;
if (isNil "_tickets") then { _tickets = []; };
if ((typeName _tickets) != "ARRAY") then { _tickets = []; };

// Ticket format: [timestamp, officerName, officerUID, reason, amount, status]
_ticket = [time, _officerName, _officerUID, _reason, _amount, "unpaid"];
_tickets set [count _tickets, _ticket];

// Persist
[_uid,_side,"Tickets",_tickets] call s_stats_write;

// If target is online, sync + notify
_unit = objNull;
{
	if ((getPlayerUID _x) == _uid) exitWith { _unit = _x; };
} forEach playableUnits;

if (!isNull _unit) then {
	[_unit, [_tickets], "court_receiveTickets", false, false] call network_MPExec;
	[_unit, [format["You received a ticket of $%1 for %2 (By %3)", _amount, _reason, _officerName]], {systemChat _this}, false, false] call network_MPExec;
};

true

