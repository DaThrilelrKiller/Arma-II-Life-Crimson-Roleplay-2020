private ["_vehicle","_item","_amount"];

_item = _this select 1;
_amount = _this select 2;

_vehicle = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 6] select 0);

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "You are already performing a action";
};

if (isnil ("_vehicle")) exitwith {
	systemChat  "Not near any vehicles"
};
if (player != vehicle player) exitWith {
	systemChat  "You must be outside the vehicle"
};

if (player distance _vehicle <= 6) then 
{
	for "_i" from 1 to 100 step 1 do {
		
		if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
			["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
		};

		[format['Refueling Vehicle %1%2',_i,"%"],'data\images\items\jerrycan',true]call tag_notify;
		uiSleep 0.1;
		if(!alive player)exitWith {};
	};

	[player,_item,-1] call storage_add;
	_vehicle setFuel 1;
};