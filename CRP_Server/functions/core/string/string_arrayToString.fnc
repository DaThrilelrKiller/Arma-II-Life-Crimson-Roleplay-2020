private["_str", "_i"];

_str = "";

if ((typeName _this) == "ARRAY") then 

	{	

	for [{_i = 0}, {_i < (count _this)}, {_i=_i+1}] do {_str = format["%1%2", _str, (_this select _i)];};

	};

_str
