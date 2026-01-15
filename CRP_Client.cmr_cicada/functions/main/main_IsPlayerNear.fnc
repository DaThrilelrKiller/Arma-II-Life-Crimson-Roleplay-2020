/*
File: fn_IsPlayerNear.sqf
Desc: Checks if there are any players within a given radius of a object
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Object
	1. Radius to check if players are near
*/


private ["_Playerdistvar","_Object","_Distance"];
_Playerdistvar = false;
_Object = _this select 0;
_Distance = _this select 1;
{
	if (_Object distance _x	< _Distance)exitWith {_Playerdistvar = true;};
}count playableUnits;
_Playerdistvar