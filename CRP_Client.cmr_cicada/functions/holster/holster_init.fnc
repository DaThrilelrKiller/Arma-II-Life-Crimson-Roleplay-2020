if (dtk_server)exitWith {};


if (dtk_civ)exitWith {
	["Holster Pistol","ku",["1",false,true,false],[["Pistol"],holster_add]]call keypress_add;
};

if (dtk_ems)exitWith {
	["Holster Fire hose","ku",["3",false,true,false],[["FirefighterWeap2"],holster_add]]call keypress_add;
};

if (dtk_cop)exitWith {
	["Holster Pistol","ku",["1",false,true,false],[["Pistol"],holster_add]]call keypress_add;
	["Holster Taser","ku",["3",false,true,false],[["DDOPP_X3"],holster_add]]call keypress_add;
};
