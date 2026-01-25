for "_i" from 0 to 1 step 0 do {
	
	dtk_hunger = dtk_hunger + 1;
	{
		if (dtk_hunger == (_x select 0))then {
			call (_x select 1);
		};
	}forEach dtk_hunger_config;
	sleep 70;
};