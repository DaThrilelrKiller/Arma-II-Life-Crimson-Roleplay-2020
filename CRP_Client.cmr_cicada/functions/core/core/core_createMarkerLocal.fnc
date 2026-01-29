
_name = _this select 0;
_position = _this select 1;
_brush = _this select 2;
_shape = _this select 3;
_color = _this select 4;
_type = _this select 5;
_size = _this select 6;
_text = _this select 7;
_direction = _this select 8;

if (isNil "_name" or isNil "_position")exitWith {
	systemchat"CreateMarkerError invalid pramerters";
};

_marker = createMarkerLocal [_name, _position];
_marker setMarkerPosLocal _position;

if (!isNil "_brush")then {
	_marker setMarkerBrushLocal _brush;
}else{
	_brush = "any";
};

if (!isNil "_shape")then {
	_marker setMarkerShapeLocal _shape;
}else{
	_shape = "any";
};

if (!isNil "_color")then {
	_marker setMarkerColorLocal _color;
}else{
	_color = "any";
};

if (!isNil "_type")then {
	_marker setMarkerTypeLocal _type;
}else{
	_type = "any";
};

if (!isNil "_size")then {
	_marker setMarkerSizeLocal _size;
}else{
	_size = "any";
};

if (!isNil "_text")then {
	_marker setMarkerTextLocal _text;
}else{
	_text = "any";
};

if (!isNil "_direction")then {
	_marker setMarkerDirLocal _direction;
}else{
	_direction = "any";
};


PureGamingMarkerArray set[count PureGamingMarkerArray,["",_position,_size,_name,_text,_type,_color]];
_marker