private["_data", "_type","_default"];
_data = _this select 0;
_default = _this select 1;

_data = (typeName _default)call {
	if (_data == "")exitWith {_default};
	if (_this == "ARRAY")exitWith {call compile _data};
	if (_this == "SCALAR")exitWith {parseNumber _data};
	if (_this == "BOOL")exitWith {call compile _data};
	format["%1", _data]
};

_data;