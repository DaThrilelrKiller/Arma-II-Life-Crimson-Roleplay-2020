private["_arr", "_i"];	

if ((typeName _this) == "STRING") then 

	{

	_arr = toArray(_this);	

	for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do {_arr SET[_i, (toString [(_arr select _i)])];};	

	_arr

	} else {[]};