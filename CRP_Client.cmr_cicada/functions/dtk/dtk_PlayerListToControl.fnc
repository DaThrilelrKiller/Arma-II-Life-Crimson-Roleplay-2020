/*
File: fn_PlayerListToControl.sqf
Desc: populates a dialog control with a list of players and set the data to the _Foreeachindex and player
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. dialog idc
	1. shoownames or just civ1, civ2... true or false
*/

private ["_idc","_Shownames","_index","_select"];

_idc = (_this select 0);
_Shownames = (_this select 1);
_select = objNull;

{
	if (_Shownames) then 
	{
		_index = lbAdd [_idc, format ["%1 - (%2)", (str _x), (name _x)]];
	} else 
	{
		_index = lbAdd [_idc, (str _x)];
	};
	lbSetData [_idc, _index, format["%1", [_forEachIndex,_x]]];
		
	_select = [_select,_index]select (_x == player);
}forEach allUnits;

lbSetCurSel [_idc,_select];