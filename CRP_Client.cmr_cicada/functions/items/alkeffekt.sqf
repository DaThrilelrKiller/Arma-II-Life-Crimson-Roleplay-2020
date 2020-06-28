﻿private ["_art","_item","_anzahl","_endeZeit","_fadeInTime","_fadeOutTime","_faded","_v1","_v2","_v3","_v1add"];

_art = _this select 0;
if (_art == "init") then 
{
	INV_alkoholusesperre = 0;
	INV_alkohDTK_usesperre = FALSE;
	INV_AlkoholCounter = 0;
};

if (_art == "use") then
{
	_item   = _this select 1;
	_anzahl = _this select 2;
	if (INV_alkoholusesperre == 1) exitWith {systemChat  localize "STRS_inv_item_druguse_toomany";};
	if (INV_alkohDTK_usesperre) then {INV_alkoholusesperre = 1;};
	INV_AlkoholCounter =  INV_AlkoholCounter + _anzahl;
	[player,_item,-(_anzahl)] call storage_add;	
	ar_baltime = time + 45 + (_anzahl * 10);
	_fadeInTime   = 0;
	_fadeOutTime  = 0;
	_faded = false;
	if (_item == "beer" OR _item == "smirnoff" OR _item == "wine" OR _item == "wine2") then 
	{
		while {time < ar_baltime} do 
		{
			if (not(alive player)) exitWith {};
			if (vehicle player == player) then 
			{
				_v1 = velocity player select 0;
				_v2 = velocity player select 1;
				_v3 = velocity player select 2;
				_v1add = (random 4 - random 4); _v2add = (random 3 - random 3);
				player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
			};
			if (time > _fadeInTime) then 
			{
				titleCut ["","WHITE OUT",0];
				_fadeOutTime = time + 1;
				_fadeInTime  = time + 5;
				_faded = false;
			};	
			if ((time > _fadeOutTime) and (!_faded)) then 
			{
				titleCut ["","WHITE IN",0];
				_faded = true;
			};
			sleep 1;
		};
	};
	if (_item == "Vodka" OR _item == "beer2" OR _item == "wiskey") then 
	{
		while {time < ar_baltime} do 
		{
			if (not(alive player)) exitWith {};
			if (vehicle player == player) then 
			{
				_v1 = velocity player select 0;
				_v2 = velocity player select 1;
				_v3 = velocity player select 2;
				_v1add = (random 10 - random 8); _v2add = (random 12 - random 10);
				player setVelocity [_v1+_v1add, _v2+_v2add, _v3];
			};
			if (time > _fadeInTime) then
			{
				titleCut ["","WHITE OUT",0];
				_fadeOutTime = time + 1;
				_fadeInTime  = time + 10;
				_faded       = false;
			};	
			if ((time > _fadeOutTime) and (!_faded)) then
			{
				titleCut ["","WHITE IN",0];
				_faded = true;
			};
			sleep 1;
		};
	};
	titleCut ["","WHITE IN",0];
	sleep 10;
	
	if (_item == "beer")then {[player,"emptybeer",+(_anzahl)] call storage_add;	};
	if (_item == "smirnoff")then {[player,"emptywine",+(_anzahl)] call storage_add;};
	if (_item == "wine")then {[player,"emptywine",+(_anzahl)] call storage_add;};
	if (_item == "wine2")then {[player,"emptywine",+(_anzahl)] call storage_add;};
	if (_item == "Vodka")then {[player,"emptyVodka",+(_anzahl)] call storage_add;};
	if (_item == "beer2")then {[player,"emptybeer",+(_anzahl)] call storage_add;};
	if (_item == "wiskey")then {[player,"emptywiskey",+(_anzahl)] call storage_add;};
	systemChat  localize "STRS_inv_item_druguse_ende";
	INV_alkoholusesperre = 0;
	INV_AlkoholCounter =  INV_AlkoholCounter - _anzahl;
};