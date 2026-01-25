private ["_amount","_return","_i","_id","_class","_name"];
_return = [];

// Arma 2 OA-safe: gather slot/unit names at runtime.
// For editor placed playable units, vehicleVarName returns the mission.sqm "text" field (e.g. Cop1, Civ1).
{
	_name = vehicleVarName _x;
	if (_name != "") then {
		_return set [count _return, _name];
	};
} forEach (playableUnits + switchableUnits);

_return