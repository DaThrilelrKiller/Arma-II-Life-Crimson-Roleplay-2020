private ["_vcl","_fuel","_damage","_rep_count","_damage_val","_fuel_val","_coef","_damage_ok","_fuel_ok","_breaked_out","_breaked_out2","_rep_action"];

_vcl = _this select 0;

_fuel = fuel _vcl;
_damage = damage _vcl;
_rep_count = 0.05;
_damage_val = (_damage / _rep_count);
_fuel_val = ((1 - _fuel) / _rep_count);
_coef = switch (true) do {
	case (_fuel_val > _damage_val): {_fuel_val};
	default {_damage_val};
};
_coef = ceil _coef;

if (_damage <0.01) exitWith{systemChat  "Vehicle is not damaged!"; hint format ["Vehicle status:\n---------------------\nVehicle is not damaged\n---------------------\nVehicle fuel: %1\nVehicle damage: %2",_fuel, _damage]};
if (_damage >0.90) exitWith{systemChat  "Vehicle is damaged beyond repair!"; hint format ["Vehicle status:\n---------------------\nVehicle damage is beyond repair!\n---------------------\nVehicle fuel: %1\nVehicle damage: %2",_fuel, _damage]};

_vcl engineOn false;

_damage_ok = false;
_fuel_ok = false;
d_cancelrep = false;
_breaked_out = false;
_breaked_out2 = false;

_rep_action = player addaction ["Cancel Service","noscript.sqf",'d_cancelrep = true;'];

hintSilent format ["Repairing..."];
for "_wc" from 1 to _coef do {
	if (!alive player || d_cancelrep) exitWith {player removeAction _rep_action};
	_vcl setvehiclelock "locked";
	_vcl lock true;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 3.0;
	waitUntil {animationState player != "AinvPknlMstpSlayWrflDnon_medic"};
	if (d_cancelrep) exitWith {_breaked_out = true};
	if (vehicle player != player) exitWith {
		_breaked_out2 = true;
		hint "You have entered a vehicle, service canceled";
	};
	if (!_fuel_ok) then {_fuel = _fuel + _rep_count; _vcl setFuel _fuel; hintsilent format ["Vehicle status:\n---------------------\nVehicle fuel: %1\nVehicle damage: %2",_fuel, _damage]};
	if (_fuel >= 1 && !_fuel_ok) then {_fuel = 1;_fuel_ok = true};
	if (!_damage_ok) then {_damage = _damage - _rep_count; _vcl setDamage _damage; hintsilent format ["Vehicle status:\n---------------------\nVehicle fuel: %1\nVehicle damage: %2",_fuel, _damage]};
	if (_damage <= 0.01 && !_damage_ok) then {_damage = 0;_damage_ok = true};
	if (_damage_ok and _fuel_ok) then {_vcl lock false; _vcl setFuel 1; _vcl setDamage 0; hint "Vehicle repaired and refuled!";systemChat  "You repaired that vehicle"};
};
if (_breaked_out) exitWith {
	hint "Service canceled";
	player removeAction _rep_action;
	_vcl lock false;
};
if (_breaked_out2) exitWith {_vcl lock false};

player removeAction _rep_action;
if (!alive player) exitWith {player removeAction _rep_action};
