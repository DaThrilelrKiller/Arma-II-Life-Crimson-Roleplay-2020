private ["_array"];

_array = _this call{
	if (typeName _this == "STRING")exitWith {missionNamespace getVariable [_this,[]]};
	if (typeName _this == "ARRAY")exitWith {_this};
	[]
};

if (typeName _array != "ARRAY" || {count _array == 0})then {
	_array = [];
	systemchat format ["[ERROR] Config/TypeName error for: %1",_this];
};

_array
