private ["_group","_vehicle"];

_group = _this select 0;
_vehicle = _this select 1;

_vehicles = _group getVariable ["vehicles",[]];
_vehicles set[count _vehicles,_vehicle];

_group setVariable ["vehicles",_vehicles,true];