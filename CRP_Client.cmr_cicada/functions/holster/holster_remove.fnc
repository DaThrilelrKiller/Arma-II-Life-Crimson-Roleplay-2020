private ["_holster","_holstered"];

_holster = _this select 0;
_holstered = player getVariable [_holster,""];

player addWeapon _holstered;
player setVariable [_holster,"",true];

_holstered call holster_selectWeapon;