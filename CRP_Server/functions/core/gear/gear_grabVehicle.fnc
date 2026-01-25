/*
File: gear_grabVehicle.fnc
Desc: Grabs the vehicle that has the same display name of the gear you are trying to acess
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
 _This. Vehicle display name (String)
*/

private ["_vehicles","_return","_name"];

_vehicles = (getPos player) nearEntities [["LandVehicle", "Air", "ship","Man"], 10];

_return = 
{
	 _name = getText (configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName");
	if (_name == _this)exitWith {_x};
}count _vehicles;

_return = [_return,objNull]select (typename _return != "OBJECT");

_return