/*
File: fn_add.sqf
Desc: Adds/removes items from object/player storage
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this select 0 object of the inventory
	_this select 1 item you are adding / removing from inventoy
	_this select 2 amount of items
*/
private ["_object","_item","_amount","_itemarray","_space","_array","_return","_maxspace","_itemkg","_currentamount","_name"];

_object = _this select 0;
if (typeName _object == "STRING")then {call compile _object}else{_object};
_item = toLower (_this select 1);
_amount = _this select 2;
_amount = if ((typeName _amount) != "SCALAR")then {parseNumber _amount}else{_amount};
if (_amount == 0)exitWith {};


_return = false;

_itemarray = _item call config_array;
_currentamount = [_object,_item]call storage_amount;
_itemkg = (_amount * (_itemarray call config_weight));
_space = [_object]call storage_kg;
_maxspace = [_object]call storage_maxkg;

if (_amount > 0) then 
{
	if ((_space + _itemkg) <= _maxspace) then 
	{
		_array = ([_object,_item, _amount] call storage_array);
	} 
	else 
	{
		systemchat format ["%1's storage is full",_object];
	};
} 
else 
{
	_array = if ((abs  _amount) > _currentamount)then {nil}else{([_object,_item, _amount] call storage_array)};
};

if (!isNil "_array")then {
	[_object,_array] call storage_set;
	_return = true;
	_name = _itemarray call config_displayname;
};

_return