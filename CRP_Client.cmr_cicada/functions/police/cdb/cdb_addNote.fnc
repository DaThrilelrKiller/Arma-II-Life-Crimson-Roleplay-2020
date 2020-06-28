private ["_object","_note","_notes","_from"];

_object = _this select 0;
_note = _this select 1;
_from = _this select 2;
_from = [_from,player]select (isNil "_from");

_notes = _object getVariable ["cdb_notes",[]];
_notes set [count _notes,[_note,_from]];

_object setVariable ['cdb_notes',_notes,true];
