private ["_return","_marker","_text"];

_return = [];

{	
	_marker =  format["house_%1",_ForEachINdex];
	_text = markerText _marker;
	if (_text == format ["%1's House",name _this])then {
		_return set [count _return,getMarkerPos _marker];
		
	};
}forEAch dtk_house_list;

_return