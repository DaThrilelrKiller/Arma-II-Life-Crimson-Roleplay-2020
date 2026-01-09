private ["_group", "_hasPlayer", "_result"];

_result = [];

{
	_group = _x;
	_hasPlayer = false;
	
	{
		if (isPlayer _x) then {
			_hasPlayer = true;
		};
	} forEach units _group;
	
	if (!_hasPlayer && {count units _group > 0}) then {
		_result set [count _result, _group];
	};
} forEach allGroups;

_result
