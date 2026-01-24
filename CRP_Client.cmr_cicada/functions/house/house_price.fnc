private ["_size","_doors","_return"];

_size = sizeOf _this;
_doors = count ([_this] call house_doors);

_return = call{
	if (_this == "Land_Ind_Workshop01_01")exitWith {800};
	if (_this == "Land_Ind_Workshop01_L")exitWith {1200};
	if (_this == "Land_HouseV_1I4")exitWith {2500};
	if (_this == "Land_sara_Domek_sedy")exitWith {1500};
	if (_this == "Land_sara_domek_zluty")exitWith {1800};
	if (_this == "Land_dum_mesto2")exitWith {1200};
	_size * (_doors/2) * 50
};

_return


