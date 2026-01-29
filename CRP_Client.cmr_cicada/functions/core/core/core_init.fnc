[]spawn core_check;
[]spawn core_version;

if (dtk_client)then {
	[]spawn core_paycheck;
	["Surrender","ku",["3",false,false,false],core_surender]call keypress_add;
	["Stun Player","kd",["F",true,false,false],core_hit]call keypress_add;
	["Ear Plugs","kd",["6",false,false,false],core_earplugs]call keypress_add;
	player disableConversation true
};

/*make a list of buildings that have building postions*/
dtk_buildings = nearestObjects [dtk_center, ["House"], dtk_center select 0];

{
	if (isNil _x)then {
		call compile format ["%1 = objNull",_x];
	};
}foreach call core_units;
