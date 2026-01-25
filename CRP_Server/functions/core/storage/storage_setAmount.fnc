private ["_object","_item","_array","_arrayitems","_arrayamount","_return","_amount","_currentamount","_new"];

_object = _this select 0;
_item = _this select 1;
_amount = _this select 2;

_array = _object getVariable ["dtk_storage",[[],[]]];

_arrayitems = _array select 0;
_arrayamount = _array select 1;

_currentamount = [_object,_item]call storage_amount;

if (_amount == 0)then
{
_return = if ([_object,_item,-_currentamount]call storage_add)then {true}else{false};
}
else
{
_return = if ([_object,_item,-_currentamount]call storage_add && {[_object,_item,_amount]call storage_add})then {true}else{false};
};

_return