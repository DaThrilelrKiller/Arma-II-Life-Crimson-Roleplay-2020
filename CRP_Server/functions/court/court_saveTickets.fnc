// Server-side: Save persisted tickets for a player
// Params: [unit, ticketsArray]
private ["_unit","_tickets","_uid","_side"];

_unit = _this select 0;
_tickets = _this select 1;

if (isNull _unit) exitWith {false};
if (isNil "_tickets") then { _tickets = []; };
if ((typeName _tickets) != "ARRAY") then { _tickets = []; };

_uid = getPlayerUID _unit;
_side = _unit getVariable ["dtk_side","CIV"];

[_uid,_side,"Tickets",_tickets] call s_stats_write;

true

