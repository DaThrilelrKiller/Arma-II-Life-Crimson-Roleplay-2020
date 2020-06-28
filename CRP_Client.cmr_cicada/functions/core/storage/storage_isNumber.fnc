/*
File: fn_isNumber.sqf
Desc: Checks if _this is a intiger if not returns false
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this string of number you want to check
*/

private ["_numbers","_return"];

if (_this == "")exitWith {false};

_numbers = [49,50,51,52,53,54,55,56,57,48];
_return = true;

{
	if !(_x in _numbers)then {
	_return = false;
	};
	true
}count toArray _this;

_return