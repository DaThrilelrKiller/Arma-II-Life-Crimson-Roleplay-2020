/*
File: id_show.fnc
Desc: Displays a player ID to all players in a 6m radius 
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	0. Use -Default for all items
*/

private ["_art","_unit","_data","_Month","_Day","_Year","_Face"];
_art = _this select 0;

if ((typeName _art) == "STRING")then
{
	["ALL",[player,dtk_dob],{
		if (player distance (_this select 0) < 5)then {_this call id_show;};
	},false,false]call network_MPExec;

}
else
{
	dtk_current_plate = name _art;
	_data = _this select 1;
	
	_Month = _data select 0;
	_Day = _data select 1;
	_Year = _data select 2;
	_Face = _data select 3;
	
	private ["_ui","_FaceUI"];
	disableSerialization;
	1010 cutRsc ["IDCard","PLAIN"];

	_ui = uiNameSpace getVariable "IDCard";
	_background = _ui displayCtrl 1201;
	_FaceUI = _ui displayCtrl 1404;
	_Name = _ui displayCtrl 1400;
	_Idnum = _ui displayCtrl 1402;
	_rank = _ui displayCtrl 1403;
	_dob = _ui displayCtrl 1401;

	_FaceUI ctrlSetText format["data\images\faces\%1.pac",_Face];
	_Name ctrlSetText format["%1",name _art];
	_Idnum ctrlSetText format["%1",getPlayerUID _art];
	_rank ctrlSetText format["%1","n/a"];
	_dob ctrlSetText format["%1 %2 %3",_Month,_Day,_Year];
};