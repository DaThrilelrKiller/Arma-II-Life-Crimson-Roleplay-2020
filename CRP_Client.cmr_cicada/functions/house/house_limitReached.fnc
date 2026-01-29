private ["_houses","_marker","_owned"];

_houses = 0;

{
	_marker = format["house_%1",_ForEachINdex];
	_owned = [_marker] call house_own;
	
	if (_owned)then {
		_houses = _houses + 1;
	};
	
}forEach dtk_house_list;

_return = if (_houses >= dtk_houseLimit)then{true}else{false};
_return 