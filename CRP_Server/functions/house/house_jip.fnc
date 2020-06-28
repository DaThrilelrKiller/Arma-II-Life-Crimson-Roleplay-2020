private ["_owner","_building","_unit","_uid"];

_unit = _this select 0;
_uid = _this select 2;

{
	_owner = markerText _x;
	
	if (_owner != "" && {_owner call core_unitOnline})then {
		_x setMarkerAlpha 1;
	}else{
		_x setMarkerAlpha 0;
	};
}forEAch dtk_houses;