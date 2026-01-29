private ["_art","_item","_class","_exitvar","_pos","_obj","_time","_counter"];
_art = _this select 0;

if (_art == "use") then 

{

_item    = _this select 1;
_class	 = _item call config_class;
_exitvar = 0;


if (_exitvar == 1) exitWith {};
if([player,_item] call storage_amount < 1) exitwith {};

[player,_item,-1] call storage_add;

_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
_obj = _class createvehicle [0, 0, 0];
_obj setdir getdir player;
_obj setpos _pos;
_time = round time;
_obj call core_setVarName;	
_counter = 0;

};
