private ["_box","_p1","_p2","_h","_pos"];


_box = boundingBox _this;
_p1 = _box select 0;
_p2 = _box select 1;
_h = abs ((_p2 select 2) - (_p1 select 2));
_h = if (_h > 2)then{2}else{_h};

_pos = getPosATL _this;
_pos = worldToScreen [_pos select 0, _pos select 1,(_pos select 2) + _h];
_pos