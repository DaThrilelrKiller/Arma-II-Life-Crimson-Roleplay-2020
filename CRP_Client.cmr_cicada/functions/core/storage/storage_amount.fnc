/*
File: fn_amount.sqf
Desc: returns how much of a specfic item are in a inventoy
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this select 0 object of the inventory
	_this select 1 item you want the amount of
*/


private ["_object","_item","_array","_arrayitems","_arrayamount","_index","_return"];

_object = _this select 0;
_item = toLower (_this select 1);

_array = _object getVariable "dtk_storage";
if (isNil "_array")exitWith {0};

_arrayitems = _array select 0;
_arrayamount = _array select 1;

_index = _arrayitems find _item;
_return = if (_index == -1)then {0}else{_arrayamount select _index};
_return