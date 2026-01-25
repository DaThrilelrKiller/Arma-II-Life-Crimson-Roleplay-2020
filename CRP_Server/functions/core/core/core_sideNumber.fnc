

_unit = _this;
_side = _unit call core_side;
	
_return = call{
	if (_side == "CIV")exitWith {0};
	if (_side == "EMS")exitWith {1};
	if (_side == "EAST")exitWith {2};
	if (_side == "PD")exitWith {3};
	4
};

_return