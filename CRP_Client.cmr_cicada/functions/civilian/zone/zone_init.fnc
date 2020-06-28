if (dtk_client)then {
	if (dtk_civ)then {
	DTK_Shop_Gangarea1 addaction ["","noscript.sqf","['DTK_GangArea_Zone_1',DTK_Shop_Gangarea1,'DTK_GangArea_Zone_1_Flag']spawn zone_capture;", 25, false, true, "LeanRight","((call gang_name) != ['DTK_GangArea_Zone_1_Flag'] call zone_owner) && {!([_target,'Cap/Neutralize Anar City (E)','\crp_data\images\tags\flag']call tag_show)}"];
	DTK_Shop_Gangarea2 addaction ["","noscript.sqf","['DTK_GangArea_Zone_2',DTK_Shop_Gangarea2,'DTK_GangArea_Zone_2_Flag'] call zone_capture;", 25, false, true, "LeanRight","((call gang_name) != ['DTK_GangArea_Zone_2_Flag'] call zone_owner) && {!([_target,'Cap/Neutralize Khushab City (E)','\crp_data\images\tags\flag']call tag_show)}"];
	DTK_Shop_Gangarea3 addaction ["","noscript.sqf","['DTK_GangArea_Zone_3',DTK_Shop_Gangarea3,'DTK_GangArea_Zone_3_Flag'] call zone_capture;", 25, false, true, "LeanRight","((call gang_name) != ['DTK_GangArea_Zone_3_Flag'] call zone_owner) && {!([_target,'Cap/Neutralize North Oil Fields (E)','\crp_data\images\tags\flag']call tag_show)}"];
	DTK_Shop_Gangarea4 addaction ["","noscript.sqf","['DTK_GangArea_Zone_4',DTK_Shop_Gangarea4,'DTK_GangArea_Zone_4_Flag'] call zone_capture;", 25, false, true, "LeanRight","((call gang_name) != ['DTK_GangArea_Zone_4_Flag'] call zone_owner) && {!([_target,'Cap/Neutralize North Oil Fields (E)','\crp_data\images\tags\flag']call tag_show)}"];
	};
};