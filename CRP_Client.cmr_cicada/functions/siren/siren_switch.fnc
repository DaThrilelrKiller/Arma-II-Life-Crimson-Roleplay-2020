if (vehicle player == player)exitWith{};

_sirens = (vehicle player) getVariable ["dtk_sirens",[]];
_active =  (vehicle player) getVariable ["dtk_siren",""];

if (count _sirens == 0)exitWith {};

if (_active == "")exitWith {
	(vehicle player) setVariable ["dtk_siren",_sirens select 0,true];
};

_index = _sirens find _active;
_index = if (count _sirens > _index + 1)then {_index + 1}else{0};

(vehicle player) setVariable ["dtk_siren",_sirens select _index,true];
titleText [format["Siren: %1",(_sirens select _index)call config_displayname], "PLAIN DOWN"];
