private ["_vehicle","_number","_ar_siren","_weapon"];


_vehicle = (vehicle player);

while {true} do 
{
	_siren = (_vehicle getVariable "dtk_siren");
	_ar_siren = createVehicle ["HeliHEmpty", [0,0,0], [], 0, "CAN_COLLIDE"];
	_ar_siren attachto[_vehicle,[0,0,-49]];
	["ALL",[_ar_siren,_siren],"siren_say",true,true]call network_MPExec;

	waitUntil {(_vehicle getVariable "dtk_siren") != _siren or (vehicle player == player) or (call siren_mode) == "Manual"};
	deleteVehicle _ar_siren;

	if (vehicle player == player)exitWith {};
	if ((call siren_mode) == "Manual")exitWith {};
};

dtk_sirenon = false;
