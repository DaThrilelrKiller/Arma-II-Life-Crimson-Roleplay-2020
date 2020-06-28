private ["_distance","_return"];

_return = {
	_distance = if (isNil "_distance")then {player distance _x}else{_distance};
	if (player distance _x < _distance)then {
		_distance = player distance _x;
		_return = _x;
	};
	_return
}foreach dtk_raods;
	
_return