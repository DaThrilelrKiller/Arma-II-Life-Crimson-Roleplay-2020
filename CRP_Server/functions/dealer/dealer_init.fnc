if (dtk_server)exitWith {};

DTK_Vehicle_Dealer addaction ["","noscript.sqf","[]call dealer_menu;", 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'Sell Vehicle (E)','data\images\tags\car']call tag_show)}","",""]];
["mrk_Dealer_1",getPos DTK_Vehicle_Dealer,nil,nil,"colorBlue","mil_dot",nil,"Crimson Vehicle Dealership"]call core_createMarkerLocal;
