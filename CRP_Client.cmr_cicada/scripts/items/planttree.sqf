/*
Script: planttree.sqf
Description: Determines what form of wood you get and how much you get.
Exec: When Axe is used.
Written by: ZKB1325
*/

private ["_art","_gettreereturn","_choppedtree","_amountchopped","_amount","_treecuttinlvlinc","_k"];

_art = _this select 0;
_item = _this select 1;


if(working) exitwith { systemChat "Your already performing an action please wait";};
if (vehicle player != player) exitWith { systemChat "you can only replant trees on foot";};
working=true;

if (_art == "use") then 

{
_foundtree = false;
	{   
	
	if ((typeOf _x == "") && {damage _x > 0}) exitWith     
		{ 
		if(primaryweapon player == "" && {secondaryweapon player == ""})then{player playmove "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"}else{player playmove "AinvPknlMstpSlayWrflDnon"};
		
   
		_x setdamage 0;  

		[player,_item,-1] call storage_add;
		[player,"geld",30] call storage_add;
		 systemChat "you replanted a tree and got $30";
		
		_foundtree = true;
		};
		
	} count (nearestObjects [player,[], 10]);
	

if !(_foundtree) exitWith {systemChat "You are not close enough to an already cut down tree";};



};
working=false;