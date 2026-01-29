private ["_group"];

_group = _this select 0;

{
	deleteVehicle _x;
}forEach units _group;

deleteGroup _group;
