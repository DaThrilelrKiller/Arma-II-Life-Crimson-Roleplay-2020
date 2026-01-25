if (dtk_client)then
{
	[]spawn {
		waitUntil {!isNil "AR_StaticsLoaded"};
		sleep 5;
		
		{
			if (_x call TFAR_fnc_isRadio || {_x == "ItemRadio"})then {
				player removeWeapon _x;
			};
		}forEach (weapons player);
		player addWeapon "ItemRadio";
		[]spawn tfar_fnc_clientinit;
		[]spawn tfar_channelCheck;
		
		tf_west_radio_code                  = "";
		tf_guer_radio_code                  = tf_west_radio_code;
		tf_civ_radio_code                   = tf_west_radio_code;
	};
};
