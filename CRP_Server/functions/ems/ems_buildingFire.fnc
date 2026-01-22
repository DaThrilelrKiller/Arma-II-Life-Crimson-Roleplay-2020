private ["_index","_object","_postions","_building"];

_index = _this select 0;
_postions = _this select 1;
_building = _this select 2;

if ((count _postions) - 1 < _index)exitWith {};

_object = createVehicle ["HeliHEmpty", [0,0,0], [],0, "CAN_COLLIDE"];
_object setPos (_postions select _index);

["ALL",[_object,4,_building],"core_burn",true,true]call network_MPExec;

sleep random(40) + 7;
if (isNull _object)exitWith {};
if (damage _object > 0.5)exitWith {};

[(_index + 1),_postions,_building]spawn s_ems_buildingFire;