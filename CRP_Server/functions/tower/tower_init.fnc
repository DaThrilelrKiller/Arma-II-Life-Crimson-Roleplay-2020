if (dtk_server)exitWith {};

DTK_Shop_GangBox2 addaction ["Hack Radio Freqs","noscript.sqf","[]spawn tower_hack", 25, false, true, "","((call gang_name) == ['DTK_GangArea_Zone_2_Flag'] call zone_owner) && {!DTK_Hacking} && {[player,'usb_radio'] call storage_amount > 0} "];
DTK_Shop_GangBox2 addaction ["Open Monitor","noscript.sqf","[]call tower_display", 25, false, true, "","((call gang_name) == ['DTK_GangArea_Zone_2_Flag'] call zone_owner) && {[player,'usb_radio'] call storage_amount > 0} "];
