if (dtk_client)then {
	["\crp_data\images\misc\Gps.paa",-0.06,-0.36] call bis_customGPS;
};


BIS_fnc_timeToString = compile preprocessFile "ca\modules\Functions\strings\fn_timeToString.sqf";
BIS_fnc_findSafePos = compile preprocessFile "ca\modules\Functions\misc\fn_findSafePos.sqf"; 
BIS_fnc_cutDecimals = compile preprocessFile "ca\modules\Functions\numbers\fn_cutDecimals.sqf";