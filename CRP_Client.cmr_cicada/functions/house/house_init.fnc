
if (dtk_server)exitWith {};

{
	_type = typeOf _x;
	_name = gettext(configFile >> "CfgVehicles" >> _type >> "Displayname");
	_marker = format["house_%1",_ForEachINdex];
	_price = _type call house_price;
	
	_x addaction ["","noscript.sqf",format["['%1',%2]call house_buy;",_marker,_price], 25, false, true, "LeanRight",format["!(['%3']call house_own) && {!([_target,'Buy %1 (%2$) (E)','\crp_data\images\misc\bank']call tag_show)}",_name,[_price] call Main_FormatMoney,_marker]];
	_x addaction ["","noscript.sqf",format["['%1']call house_menu;",_marker], 25, false, true, "LeanRight",format["(['%2']call house_own) && {!([_target,'Access %1 (E)','\crp_data\images\misc\bank']call tag_show)}",_name,_marker]];

}forEAch dtk_house_list;

DTK_House_Shop_1 addaction ["","noscript.sqf","[]call house_market;", 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'House Market (E)','\crp_data\images\misc\bank']call tag_show)}","",""]];
DTK_House_Shop_2 addaction ["","noscript.sqf","[]call house_market;", 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'House Market (E)','\crp_data\images\misc\bank']call tag_show)}","",""]];
DTK_House_Shop_3 addaction ["","noscript.sqf","[]call house_market;", 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'House Market (E)','\crp_data\images\misc\bank']call tag_show)}","",""]];
["mrk_House_Shop_1",getPos DTK_House_Shop_1,nil,nil,"colorBlue","mil_dot",nil,"House Market"]call core_createMarkerLocal;
["mrk_House_Shop_2",getPos DTK_House_Shop_2,nil,nil,"colorBlue","mil_dot",nil,"House Market"]call core_createMarkerLocal;
["mrk_House_Shop_3",getPos DTK_House_Shop_3,nil,nil,"colorBlue","mil_dot",nil,"House Market"]call core_createMarkerLocal;

[]spawn house_loop;