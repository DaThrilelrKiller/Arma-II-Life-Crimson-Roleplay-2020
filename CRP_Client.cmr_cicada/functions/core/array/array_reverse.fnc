_array = _this;
_return = [];

for "_i" from (count _array) - 1 to 0 step -1 do 
{
	_return set [count _return,(_array select _i)];
};

_return
