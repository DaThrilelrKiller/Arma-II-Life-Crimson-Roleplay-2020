private ["_hour","_return"];

_hour = date select 3;
_return = !(_hour > 6 && {_hour < 18});
_return