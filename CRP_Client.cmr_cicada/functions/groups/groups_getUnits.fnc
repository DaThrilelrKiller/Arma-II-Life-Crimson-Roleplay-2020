private ["_group", "_result", "_unit", "_vehicle"];

_group = _this select 0;
_result = [];

if (!isNil "_group" && {typeName _group == "GROUP"}) then {
	{
		_unit = _x;
		_vehicle = vehicle _unit;
		
		if (_vehicle == _unit && {!(_vehicle in _result)}) then {
			_result set [count _result, _vehicle];
		};
	} forEach units _group;
};

_result

