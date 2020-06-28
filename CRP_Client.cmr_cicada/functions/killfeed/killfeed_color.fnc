private ["_color","_side","_name"];
if ([_this,["Air", "Ship", "LandVehicle"]]call core_isKindOf)then {
	if (_this emptyPositions 'Gunner' == 1)then {
		_this = gunner _this;
	}else{
		_this = driver _this;

	};
};

_side = _this call core_side;

_color = call{
	if (_side == "CIV")exitWith {"#a8a6a6"};
	if (_side == "UN")exitWith {"#338c00"};
	if (_side == "PD")exitWith {"#002f8e"};
	"#a8a6a6"
};

_name = format ["<t color='%1'>%2</t>",_color,name _this];

_name