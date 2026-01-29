/* this returns current election data */
private ["_votes","_return"];

_return = [];

{
	_votes = _x getVariable ["votes",0];
	if (_votes > 0 && {player != _x})then {
		_return set [count _return,[_x,_votes]];
	};
	if (player == _x && {_votes == 0})then {
		_return set [count _return,[_x,_votes]];
	};
}forEAch playableUnits;

_return