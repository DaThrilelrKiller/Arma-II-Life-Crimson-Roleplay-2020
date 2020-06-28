/*
File: fn_plant.sqf
Desc: Allows mas planting of specified plants in the master array that use this function
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	_this select 1 - The script name of the item you are planting
	_this select 2 - The amount that you want to plant
*/


private ["_item","_name","_classname","_amount","_y","_plant","_amounplanted"];
_item = _this select 1;
_amount = _this select 2;
_name = _item call config_displayname;
_classname = _item call drug_class;

if (ar_planting)exitWith {systemChat "You are already playnting somting"};
if !(call drug_isAbleToPlant)exitWith {systemChat "you must be 900m aways from a gang area and in grass";};

ar_planting = true;
ar_plantingaction = player addaction [format["Cancle planting %1 of %2",_amount,_name],"noscript.sqf", 'ar_planting = false', 1, false, true, "", "true"];


for "_y" from 1 to _amount step 1 do 
{ 
	if !([player,_item,-1] call storage_add)exitWith {};
	
	["ALL",[player,"ainvpknlmstpslaywrfldnon_medic"],"network_SwitchMove",false,true]call network_MPExec;
	waitUntil {animationState player != "ainvpknlmstpslaywrfldnon_medic" or !ar_planting};
	if !(ar_planting)exitWith {};
	
	_plant = _classname createvehicle (getpos player);
	_plant setPos [getPos _plant select 0, getPos _plant select 1, -1];
	_plant call core_setVarName;		
	["ALL",[_plant,['','noscript.sqf',format['[%1] call fingerprints_gather',_plant],-1,false,true,'LeanRight',format ['player distance _target < 5 && {dtk_cop} && {[player,"brush"] call storage_amount > 0} && {!([_target,"Gather Prints %1 (E)","\crp_data\images\tags\fingerprint"]call tag_show)}',_name]]],"network_addAction",false,true]call network_MPExec;
	_amounplanted = _y;
};

player removeAction ar_plantingaction;
systemChat format ["You planted %2 of %1",_name,_amounplanted];
ar_planting = false;

