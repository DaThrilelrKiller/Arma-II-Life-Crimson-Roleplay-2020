/*
File: fn_kg.sqf
Desc: returns the weight of a storage
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this select 0 object of the inventoy
*/

private ["_object","_array","_arrayitems","_arrayamount","_return","_amount","_weight"];

_object = _this select 0;
_return = 0;

_array = _object getVariable ["dtk_storage",[[],[]]];

_arrayitems = _array select 0;
_arrayamount = _array select 1;

{
	_amount = _arrayamount select _ForEachIndex;
	_weight = _x call config_weight;
	_return = _return + (_amount * _weight);
}forEach _arrayitems;

_return