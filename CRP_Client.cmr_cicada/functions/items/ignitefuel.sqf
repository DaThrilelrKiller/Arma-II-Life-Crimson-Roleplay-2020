private["_art","_item","_anzahl"];

_art = _this select 0;
if (_art == "use") then 
{
	_item   = _this select 1;		
	_anzahl = _this select 2;
	if (player == vehicle player)exitWith {systemChat  localize "STRS_inv_items_ignite_ignite_notincar";};	
	if ((damage vehicle player) == 1)    exitWith {systemChat  localize "STRS_inv_items_repair_notneeded";};	
	(vehicle player) setDamage 0.95;				
	systemChat  localize "STRS_inv_items_ignite_ignite";																
	[player,_item,-1] call storage_add;
};