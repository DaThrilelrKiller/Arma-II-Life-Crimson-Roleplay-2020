/*
File: fn_AddItemRadio.sqf
Desc: Checks to see if players spawns with radio by dedault if not it will add one
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

private ["_playertyp","_array"];
_playertyp = typeOf _this;
_array = getArray (configFile >> "CfgVehicles" >> _playertyp >> "weapons");

if !("ItemRadio" in _array)then
{
	_this addWeapon "ItemRadio";
};