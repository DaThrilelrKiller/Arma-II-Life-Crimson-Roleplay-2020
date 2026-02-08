private ["_size","_doors","_return"];

_size = sizeOf _this;
_doors = count ([_this] call house_doors);

_return = call{
	if (_this == "Land_Ind_Workshop01_01")exitWith {5000};
	if (_this == "Land_Ind_Workshop01_L")exitWith {7500};
	if (_this == "Land_HouseV_1I4")exitWith {45000};
	if (_this == "Land_sara_Domek_sedy")exitWith {25000};
	if (_this == "Land_sara_domek_zluty")exitWith {35000};
	if (_this == "Land_dum_mesto2")exitWith {22500};
	_size * _doors * 1000
};

_return


