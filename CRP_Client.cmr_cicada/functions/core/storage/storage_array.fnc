/*
File: fn_array.sqf
Desc: backend function to add and remove items from the storage
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
	private ["_object","_item","_amount","_storage","_aitems","_arrayamount","_currentAmount","_index","_newamount"];

	_object = _this select 0;
	_item = _this select 1;
	_amount = _this select 2;

	_storage = _object getVariable "dtk_storage";
	if (isNil "_storage")then {
		_storage = [[],[]];
	};
	
	_aitems = _storage select 0;
	_arrayamount = _storage select 1;

	if (_item in _aitems) then 
	{
		 _index = _aitems find _item;
		 _currentAmount = _arrayamount select _index;
		 _newamount = (_amount + _currentAmount);
		 if (_newamount < 1)then
		 {
			_aitems set [_index,""];
			_arrayamount set [_index,""]; 
			_aitems = _aitems - [""];
			_arrayamount = _arrayamount - [""];
		 }
		 else
		 {
			_arrayamount set [_index,_newamount];
		 }
	}
	else
	{
		_index = count _aitems;
		_aitems set [_index,_item];
		_arrayamount set [_index,_amount];
	};

	[_aitems,_arrayamount]