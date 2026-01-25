// Server-side: Load persisted tickets for a player and send to client
private ["_unit","_uid","_side","_tickets"];

_unit = _this select 0;
if (isNull _unit) exitWith {false};

_uid = getPlayerUID _unit;
_side = _unit getVariable ["dtk_side","CIV"];

_tickets = [_uid,_side,"Tickets",[]] call s_stats_read;
if (isNil "_tickets") then { _tickets = []; };
if ((typeName _tickets) != "ARRAY") then { _tickets = []; };

[_unit, [_tickets], "court_receiveTickets", false, false] call network_MPExec;

true

