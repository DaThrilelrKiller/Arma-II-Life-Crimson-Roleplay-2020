private ["_members","_return","_name","_rank"];

/* find player gang */
_members = gangs getVariable [_this,[]];

/* search gang for player and retive their rank */
_return = 
{
	_name = _x select 0;
	_rank = _x select 1;
	if (name player == _name)exitWith {_rank};
}forEach _members;

_return = if (isNil "_return")then {""}else{_return};
_return