private ["_idc","_gang","_members","_name","_rank","_index"];

_idc = _this select 0;
_gang = _this select 1;

_members = gangs getVariable [_gang,[]];


{
	_name = _x select 0;
	_rank = _x select 1;
	
	if (_name != "")then {
		_index = lbAdd [_idc,format["%1 - %2",_name,_rank]];
		lbSetData [_idc, _index, format["%1", [_forEachIndex,_x]]];
	};
}forEach _members;
