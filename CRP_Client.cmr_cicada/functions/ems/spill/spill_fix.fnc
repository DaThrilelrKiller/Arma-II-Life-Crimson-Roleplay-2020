private ["_object","_markers"];

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "You are already performing a action";
};

_object = _this select 0;
_markers = _this select 1;

for "_i" from 0 to 100 step 1 do 
{
	[format['%1%2 of the leak contained',_i,"%"],'\crp_data\images\tags\spill',true]call tag_notify;

	if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
		["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
	};

	if (_i == 100)exitWith {
		deleteVehicle _object;
		systemChat "You have saved the day! By stoping the chemical leak!";
		{deleteMarker _x;}forEach _markers;
		[player,"geld", 8000] call storage_add;			
		systemChat "You Have Been Paid 8,000$ For being a bad ass!";
	};
	sleep 0.3;
};