_wlveh = [ "GNTXFloat2","CHRYSLER_B_limmo", "pook_freighter1", "pook_tugboat1", "pook_kayak1_hunt", "lancer_right", "lancer_left", "b1b_MK82_86095", "lcu", "PBX", "Aircrane", "stretcher", "ParachuteBase", "ParachuteWest", "Parachute", "ParachuteEast", "ParachuteG", "ParachuteC", "ParachuteBigBase", "ParachuteBigWest", "ParachuteBigEast", "ParachuteMediumBase", "ParachuteMediumWest", "ParachuteMediumEast", "BIS_Steerable_Parachute", "dbo_rope_60_MH6_GA", "dbo_rope_120_MH6_GA", "dbo_rope_60_GA", "dbo_rope_120_GA", "dbo_rope_MH6_GA", "dbo_rope_GA", "dbo_rope_601_MH6_GA", "dbo_rope1_MH6_GA", "dbo_rope_1201_MH6_GA", "dbo_rope_601_GA", "dbo_rope1_GA", "dbo_rope_1201_GA", "dbo_rope_ground_GA", "dtk_kmesiren1", "weaponholder", "EvMoney", "Suitcase", "SmokeShellGreen", "SmokeShellred","dtk_lightbar" ];


{
	if !(local _x)then {
		if !((typeof _x) in _wlveh)then{
			if (isnil{_x getVariable "DTK_OwnerUID"})then{
				sleep 1;/*just to double check. just in case the player just bought it*/
				if (isnil{_x getVariable "DTK_OwnerUID"})then{
					if !(isNil {_x getVariable "AM_CP"})exitWith {};
					[_x,[_x,_x,format["Blacklisted Vehicle: %1",typeOf _x]],"OwlEye_ban",false,true]call network_MPExec;
					deleteVehicle _x;
				};
			};
		};
	};
}forEAch (allMissionObjects "LandVehicle") + (allMissionObjects "Air") + (allMissionObjects "ship");