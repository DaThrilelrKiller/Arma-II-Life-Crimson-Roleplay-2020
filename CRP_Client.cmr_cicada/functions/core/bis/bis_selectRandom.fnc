scriptName "Functions\arrays\fn_selectRandom.sqf";
/************************************************************
	Random Select
	By Andrew Barron

Parameters: array

This returns a randomly selected element from the passed array.

Example: [1,2,3] call BIS_selectRandom
Returns: 1, 2, or 3
************************************************************/

private ["_ret"];

_ret = objNull;							

if(count _this > 0) then
{
	_ret = (count _this) - 1;           
	_ret = random _ret;
	_ret = _this select _ret;           
};

_ret