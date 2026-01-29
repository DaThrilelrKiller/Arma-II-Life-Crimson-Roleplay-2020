private ["_object","_markers"];

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "You are already performing a action";
};

_objects = _this select 0;
_markers = _this select 1;

for "_i" from 0 to 100 step 1 do 
{
	[format['%1%2 Cleaning up vehicle accident',_i,"%"],'data\images\tags\jaws',true]call tag_notify;

	if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
		["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
	};

	if (_i == 100)exitWith {
		{deleteVehicle _x}forEach _objects;
		systemChat "You have saved the day! By cleaning up a accident!";
		{deleteMarker _x;}forEach _markers;
		[player,"geld", 8000] call storage_add;			
		systemChat "You Have Been Paid 8,000$ For being a bad ass!";
	};

	if (!(alive player)) exitWith {};
	sleep 0.1;
};