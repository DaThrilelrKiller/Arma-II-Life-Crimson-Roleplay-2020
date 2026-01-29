_array1 = _this select 0;
_array2 = _this select 1;
_return = 0;
	
{
	_index = _array2 find _x;
	if (_index != -1)then {
		_return = _return + 1;
	};

}forEach _array1;

_return