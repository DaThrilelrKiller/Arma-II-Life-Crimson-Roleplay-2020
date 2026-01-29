private ["_group", "_hasPlayer", "_unit", "_result"];

_result = grpNull;

{
	_group = _x;
	_hasPlayer = false;
	
	{
		if (isPlayer _x) then {
			_hasPlayer = true;
		};
	} forEach units _group;
	
	if (!_hasPlayer && {count units _group > 0}) exitWith {
		_result = _group;
	};
} forEach allGroups;

[_result]call groups_delete;
