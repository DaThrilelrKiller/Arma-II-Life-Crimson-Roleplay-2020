private ["_object","_item","_array","_arrayitems","_arrayamount","_index","_return"];

_object = _this select 0;
_item = _this select 1;
_return = false;

_array = _object getVariable ["dtk_storage",[[],[]]];

_arrayitems = _array select 0;
_arrayamount = _array select 1;

if (_item in _arrayitems)then
{
	_index = _arrayitems find _item;
	_arrayitems set [_index,""];
	_arrayamount set [_index,""]; 
	_arrayitems = _arrayitems - [""];
	_arrayamount = _arrayamount - [""];
	_array = [_arrayitems,_arrayamount];
	[_object,_array] call storage_set;
	_return = true;
}
else
{
	_return = true;
};

_return