private ["_name","_area","_color","_location","_index","_mrkarea","_text"];

_name = _this select 0;
_area = _this select 1;
_color = _this select 2;
_location = _this select 3;

_index = []call ems_getMarker;

_mrkarea = createMarker [format["mrk_ems_%1_area",_index],_location];
_mrkarea setMarkerShape "ELLIPSE";
_mrkarea setMarkerSize [_area,_area];
_mrkarea setMarkerColor _color;

_text = createMarker [format["mrk_ems_%1",_index],_location];
_text setMarkerType "mil_dot";
_text setMarkerSize [1,1];
_text setMarkerColor "ColorBlack";
format["mrk_ems_%1",_index] setMarkerText _name;

[format['mrk_ems_%1_area',_index],format['mrk_ems_%1',_index]]