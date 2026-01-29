_array = _this select 0;
_index = _this select 1;
_lenght = count _array;
_next = _index + 1;

if (_lenght >= _next)then {
	_array = _array select _next;
}else{
	_array = _array select 0;
};

_array