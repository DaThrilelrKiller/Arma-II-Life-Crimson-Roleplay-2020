private ["_marker","_type","_size"];

{
	_marker = format["house_%1",_ForEachINdex];
	_type = typeof _x;
	_size = round (SizeOf _type);

	if (player distance (getMarkerPos _marker) < _size && {[_marker]call house_own})exitWith{
		true
	};
	false
}forEach dtk_house_list;
