private ["_size","_doors","_return"];

_size = sizeOf _this;
_doors = count ([_this] call house_doors);

_return = call{
	if (_this == "Land_Ind_Workshop01_01")exitWith {475000};
	if (_this == "Land_Ind_Workshop01_L")exitWith {545000};
	if (_this == "Land_HouseV_1I4")exitWith {4700000};
	if (_this == "Land_sara_Domek_sedy")exitWith {3925000};
	if (_this == "Land_sara_domek_zluty")exitWith {5650000};
	if (_this == "Land_dum_mesto2")exitWith {3715000};
	_size * (_doors/2) * 100000
};

_return


