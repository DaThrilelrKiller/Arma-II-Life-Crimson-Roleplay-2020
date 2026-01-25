private ["_i","_return"];
_i = 0;
while {_i < 100} do {
	if (str (getMarkerPos format["mrk_ems_%1",_i]) != '[0,0,0]')exitWith {};
	_i = _i + 1;
};

_return = !(_i == 100);
_return
