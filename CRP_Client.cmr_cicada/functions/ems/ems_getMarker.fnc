private ["_i"];
_i = 0;
while {_i < 100} do {
	_i = _i + 1;
	if (str (getMarkerPos format["mrk_ems_%1",_i]) == '[0,0,0]')exitWith {};
};

_i