/*
File: fn_maxkg.sqf
Desc: returns the max weight the storage can hold
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this select 0  object that you want to get the max weight of
*/

private ["_object","_variable","_return"];

_object = _this select 0;
_variable = _object getVariable "DTK_OwnerUID";

_return = if (isNil "_variable")then {dtk_player_storage}else {(_variable select 1) call config_storage};
_return = _object getVariable["dtk_upgrade",_return];
_return