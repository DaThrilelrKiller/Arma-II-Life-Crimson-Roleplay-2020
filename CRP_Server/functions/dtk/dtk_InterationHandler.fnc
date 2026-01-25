/*
File: fn_InterationHandler.sqf
Desc: Adds Actions to interation menu if conditions are ment
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/


private ["_Condition","_Text","_Action","_index","_Data"];

_index = lbAdd [1500, "Interact Menu"];
_index = lbAdd [1500, "========================================"];
{
	_Condition = call compile(_x select 1);
	if (_Condition)then
	 {
		_Text = call compile(_x select 0);
		_Action =  (_x select 2);
		_index = lbAdd [1500, _Text];
		lbSetData [1500, _index, _Action];
	 };
	 true
}count USBW_Interactions;

while {ctrlVisible 1500}do
{
if ((lbCurSel 1500) != -1) exitWith {_Data = (lbData [1500, (lbCurSel 1500)]); closeDialog 0; call compile _Data;};
};