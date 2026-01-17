private ["_marker","_name","_pos","_size","_marker1"];

{
	_name = (_x select 0) call config_displayname;
	_pos = _x select 1;
	_size = _x select 2;
	
	_marker = createMarkerLocal [("hunt_" + (_x select 0) + str _forEachIndex),_pos];
	_marker setMarkerTypelocal "mil_dot";
	_marker setMarkerColorLocal "colorRed";
	_marker setMarkerTextLocal _name;
	_marker setMarkerAlphaLocal 1;
	
	_marker1 = createMarkerLocal [("huntA_" + (_x select 0) + str _forEachIndex),_pos];
	_marker1 setMarkerTypeLocal "Empty";
	_marker1 setMarkerShapeLocal "ELLIPSE";
	_marker1 setMarkerColorLocal "ColorWhite";
	_marker1 setMarkerAlphaLocal 1;
	_marker1 setMarkerSizeLocal _size;
	
}ForEach _this;

hunting_spots = _this;
