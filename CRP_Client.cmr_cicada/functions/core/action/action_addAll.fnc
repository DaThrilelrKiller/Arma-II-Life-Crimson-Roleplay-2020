private ["_object","_array","_index"];

_object = _this select 0;
_array = _object getVariable ["dtk_actions",[]];

{
	_index = _object addAction (_x select 1);
	_array set [_ForEachIndex,[_index,(_x select 1)]];
}forEach _array;

_object setVariable ["dtk_actions",_array];
