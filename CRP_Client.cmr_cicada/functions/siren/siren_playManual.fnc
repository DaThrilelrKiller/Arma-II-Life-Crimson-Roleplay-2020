private ["_vehicle","_siren","_ar_siren"];

_vehicle = (vehicle player);
_siren = (_vehicle getVariable "dtk_siren");

_ar_siren = createVehicle ["HeliHEmpty", [0,0,0], [], 0, "CAN_COLLIDE"];
_ar_siren attachto[_vehicle,[0,0,-49]];

["ALL",[_ar_siren,_siren],"siren_say",true,true]call network_MPExec;

[_ar_siren]spawn
{
	waitUntil {!dtk_sirenon or (vehicle player == player)};
	deleteVehicle (_this select 0);
};
