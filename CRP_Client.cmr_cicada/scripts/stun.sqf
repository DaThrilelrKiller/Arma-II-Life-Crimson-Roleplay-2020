private ["_art", "_ammo", "_wep", "_bullet", "_vel", "_pos", "_teiler", "_shooter", "_selection", "_weapons", "_unit", "_stunActiveTime"];

_shooter   = _this select 0;
_unit = _this select 1;
_selection = _this select 2;

if (vehicle _unit != _unit) exitWith {
	[_shooter, ["dtk_client", "The person you tried to tase is in a vehicle!", 3], "network_chat", false, false] call network_MPExec;
};

if (_selection == "Legs") exitWith {
	if (!canstand _unit) exitWith {};
	_unit setHit ["Legs", 1];
};

if (_selection == "Hands") exitWith {
	if (handshit _unit == 1) exitWith {};
	_unit setHit ["Hands", 1];
};

_unit setVariable ["isstunned", true, true];
_stunActiveTime = (_unit getVariable ["StunActiveTime", 0]) + StunTimePerHit;
_unit setVariable ["StunActiveTime", _stunActiveTime, true];

if (vehicle _unit != _unit) exitWith {};

if (_unit == player) then {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [10];
	"dynamicBlur" ppEffectCommit 0;
	waitUntil { ppEffectCommitted "dynamicBlur" };
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit _stunActiveTime;
};

["ALL", ["dtk_client", format ["%1 was tased by %2", name _unit, name _shooter], 1], "network_chat", false, true] call network_MPExec;

if (!(_unit call core_prone)) then {
	["ALL", [_unit, "adthpercmstpslowwrfldnon_4"], "network_SwitchMove", false, true] call network_MPExec;
} else {
	["ALL", [_unit, "adthppnemstpsraswpstdnon_2"], "network_SwitchMove", false, true] call network_MPExec;
};

_weapons = weapons _unit - nonlethalweapons;
if (count _weapons > 0) then {
	{ _unit removeWeapon _x } count _weapons;
	call compile format ['waffenhalter%1 = "weaponholder" createVehicle getpos _unit; waffenhalter%1 setVehicleInit "waffenhalter%1 = this;"; processInitCommands;', AR_playerString];
	sleep 0.5;
	(format ["{waffenhalter%2 ADDWEAPONCARGO [_x, 1];} count %3; waffenhalter%2 setpos %4;", _unit, AR_playerString, _weapons, (getpos _unit)]) call network_broadcast;
	sleep 0.5;
};

_stunActiveTime = _unit getVariable ["StunActiveTime", 0];
while { _stunActiveTime > 0 } do {
	if (_stunActiveTime > MaxStunTime) then {
		_stunActiveTime = MaxStunTime;
	};
	_stunActiveTime = _stunActiveTime - 1;
	_unit setVariable ["StunActiveTime", _stunActiveTime, true];
	sleep 1;
};

_unit setVariable ["StunActiveTime", 0, true];

if (animationstate _unit != "civillying01" and 
	animationstate _unit != "civilsitting" and 
	animationstate _unit != "civilsitting02" and 
	animationstate _unit != "civilsitting03") then {
	_unit setVariable ["isstunned", false, true];
	if (_unit call ISSE_IsVictim) then {
		["ALL", [_unit, "amovppnemstpsnonwnondnon"], "network_SwitchMove", false, true] call network_MPExec;
	};
};
