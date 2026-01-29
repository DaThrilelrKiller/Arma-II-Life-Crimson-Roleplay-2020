private ["_return","_side"];

_return = call {
	if (local _this)exitWith {
		if (playerSide == civilian)exitWith {"CIV"};
		if (playerSide == resistance)exitWith {"UN"};
		if (playerSide == west)exitWith {"PD"};
	};
	
	_side = _this getVariable "dtk_side";
	if !(isNil "_side")exitWith {_side};
	
	if (side _this == civilian)exitWith {"CIV"};
	if (side _this == resistance)exitWith {"UN"};
	if (side _this == west)exitWith {"PD"};
};


_return