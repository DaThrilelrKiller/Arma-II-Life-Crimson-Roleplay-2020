private ["_item","_closeVcl"];

_item   = _this select 1;
_closeVcl = (getPos player nearEntities [["LandVehicle", "Air", "ship"], 7] select 0);
if (isNil '_closeVcl')exitWith {systemChat "There are no Vehicles in Range!";};

if ((fuel _closeVcl) < 0.1) exitWith {systemChat  "there is not enough fuel in this car to syphon";};

[player,_item,-1] call storage_add;

for "_i" from 1 to 100 step 1 do {
	
	if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
		["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
	};
	
	[format['Syphoning fuel %1%2',_i,"%"],'data\images\items\syphon',true]call tag_notify;
	uiSleep 0.1;
	if(!alive player)exitWith {};
};
	
_closeVcl setFuel 0; 
systemChat  localize "STRS_inv_items_empty_refueled";
[player,"kanister",1] call storage_add;