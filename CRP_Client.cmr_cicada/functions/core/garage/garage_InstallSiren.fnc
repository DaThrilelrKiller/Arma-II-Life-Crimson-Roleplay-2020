private ["_vehicle","_siren"];

_vehicle = _this select 0;
_siren = _this select 1;

_sirens = _vehicle getVariable ["dtk_sirens",[]];
_sirens set [count _sirens,_siren];

_vehicle setVariable ["dtk_sirens",_sirens,true];
titleText [format ["Siren %1 had been installed",((_this select 0) call config_displayname)], "PLAIN"];
