private ["_vehicle","_upgrade"];

_vehicle = (vehicle player);

if (_vehicle == player)exitWith {};

_upgrade = _vehicle getVariable "upgrades_cc";
_upgrade = [nil,round (speed _vehicle)]select isNil "_upgrade";

if (isNil "_upgrade")then {
	systemchat "Cruise Control has been truned off";
}else{
	systemchat format ["Cruise Control has been set to %1",_upgrade];
};

_vehicle setVariable ["upgrades_cc",_upgrade];
