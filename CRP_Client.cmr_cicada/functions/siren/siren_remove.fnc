private ["_vehicle","_siren","_index"];

_vehicle = _this select 0;
_siren = _this select 1;

_sirens = _vehicle getVariable ["dtk_sirens",[]];
_index = _sirens find _siren;

if (_index == -1)exitWith {};

_sirens set [_index,""];
while {"" in _sirens}do {
	_sirens = _sirens - [""];
};

_vehicle setVariable ["dtk_sirens",_sirens,true];
titleText [format ["Siren %1 had been removed",(_siren call config_displayname)], "PLAIN"];
