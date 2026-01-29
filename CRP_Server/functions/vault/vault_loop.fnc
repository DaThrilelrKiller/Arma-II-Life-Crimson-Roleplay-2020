
waitUntil {

	sleep 900;
	{
			
		if !([_x,20]call Main_IsPlayerNear)then {
			[_x]call s_vault_setAmount;
		};
	}forEach allMissionObjects "il_money_stack_20";
	false
};