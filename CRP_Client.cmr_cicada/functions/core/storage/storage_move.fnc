/*
File: fn_move.sqf
Desc: moves a item from one object storage to another
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	 _this select 0 storage of the object you want to move the item from
	 _this select 1 storage you want to move the item to
	 _this select 2 the item you want to move
	 _this select 3 the amount you want to move
*/


private ["_from","_to","_item","_amount","_object"];
_from = _this select 0;
_to = _this select 1;
_item = toLower (_this select 2);
_amount = _this select 3;
_object = if (player == _from)then {_to}else{_from};

if (_amount call storage_isNumber)then
{
	_amount = parseNumber _amount;
	if ([_from,_item]call storage_amount <  _amount)exitwith {
		systemchat "you dont have that much";
	};
	if ([_to,_item,_amount]call storage_add)then {
		[_from,_item, - _amount]call storage_add;
		closedialog 0;
		[_object] call storage_trunk;
	};


}
else 
{
systemchat format ["%1 is not a valid number",_amount];
};