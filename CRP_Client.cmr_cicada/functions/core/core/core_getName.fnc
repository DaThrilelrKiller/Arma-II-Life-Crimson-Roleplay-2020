_type = typeOf _this;

_return = call {
	if (_type == "Land_Misc_Cargo1Bo")exitWith {"Cargo Container"};
	if (_type == "Land_A_MunicipalOffice")exitWith {"Voting Booth"};
	if (_type == "Land_Panelak2")exitWith {"Hotel"};
	if (_type == "Land_Barn_Metal")exitWith {"Warehouse"};
	if (_type == "Land_Ind_Stack_Big")exitWith {"Stack Fire"};
	if (_type == "Land_Ind_Vysypka")exitWith {"Factory"};
	if (_type == "Land_A_CraneCon")exitWith {"Crane Fire"};
	if (_type == "Land_A_BuildingWIP")exitWith {"Contruction Site"};
	if (_type == "Land_A_CraneCon")exitWith {"Contruction Site"};
	if (_type == "Land_A_CraneCon")exitWith {"Crane Fire"};
	if (_type == "Land_A_CraneCon")exitWith {"Crane Fire"};
	getText(configFile >> "cfgVehicles" >> _type >> "DisplayName")
};

_return