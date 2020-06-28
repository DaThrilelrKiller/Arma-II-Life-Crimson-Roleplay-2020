/*
File: fn_random.sqf
Desc: Returns a random true or false
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Chance for it to be true
*/

private ["_chance","_return"];
_chance = _this select 0;
_return = if ((random 100) < _chance)then {true}else {false};
_return;