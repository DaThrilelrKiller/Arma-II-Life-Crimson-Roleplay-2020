v_impound = ["server", "Main", "impound",[]]call S_stats_read;

if (isNil "v_impound")then {
	v_impound = [];
};

publicVariable "v_impound";
