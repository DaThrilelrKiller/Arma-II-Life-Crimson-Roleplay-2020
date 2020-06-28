createDialog format["vehicle_menu_%1",dtk_side];

dtk_vehicle = _this select 0;
dtk_unit = driver dtk_vehicle;

if (dtk_side == "PD")exitWith {
	if (isNull dtk_unit)then {
		ctrlEnable [100, false];
		ctrlEnable [102, false];
		ctrlEnable [103, false];
		ctrlEnable [105, false];
	}else{
		ctrlEnable [106, false];
		ctrlEnable [107, false];
	};
	ctrlEnable [108, false];
};

if (dtk_side == "UN")exitWith {
	if (isNull dtk_unit)then {
		ctrlEnable [100, false];
	}else{
		ctrlEnable [101, false];
	};
	ctrlEnable [102, false];
	ctrlEnable [103, false];
	ctrlEnable [105, false];
	ctrlEnable [106, false];
	ctrlEnable [107, false];
	ctrlEnable [108, false];
};

if (dtk_side == "CIV")exitWith {

};