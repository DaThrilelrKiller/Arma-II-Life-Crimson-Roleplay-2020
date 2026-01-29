if (dtk_server)exitWith {};
[] spawn 
{
	waitUntil {!isNil "AR_StaticsLoaded"};
	disableSerialization;
	private ["_i","_vcl","_vclClass","_storweight","_maxweight","_stor","_veh","_wephud"];
	1001 cutRsc ["ar_hud","PLAIN"];
	
	_hud = uiNameSpace getVariable "ar_hud";
	
	for "_i" from 0 to 1 step 0 do 
	{
		uiSleep 0.1;
		
		call hud_names;
		call hud_updateplayer;

	};
};

