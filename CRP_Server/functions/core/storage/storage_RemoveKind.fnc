private ["_object","_kind","_array","_arrayitems","_arrayamount","_return"];

_object = _this select 0;
_kind = _this select 1;
_amount = 0;
_cost = 0;

_array = _object getVariable ["dtk_storage",[[],[]]];

_arrayitems = _array select 0;
_arrayamount = _array select 1;

{
	if (_x call config_kind == _kind)then
	{
		_amount = _amount + (_arrayamount select _ForEachIndex);
		[_object,_x,0]call storage_setAmount;
		_cost = _cost + ((_x call config_buycost)*_amount);
	};
}foreach _arrayitems;

_return = [_amount,_cost];
_return