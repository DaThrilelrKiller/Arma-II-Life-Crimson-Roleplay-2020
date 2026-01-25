private ["_Array","_temp","_split","_return","_splitwhere"];
_Array = toArray (_this select 0);
_splitwhere = toArray (_this select 1);
_Array set [count _Array,_splitwhere select 0];
_temp = [];
_split = [];
_return = [];

{
	if (_x in _splitwhere)then
	{
	_temp set [count _temp,_forEachIndex];
	};
}forEach _Array;


{
	if !(_forEachIndex in  _temp)then
	{
		_split set [count _split,_x];
	}
	else
	{
		_return set[count _return,toString _split];
		_split = [];
	};
}forEach _Array;

_return