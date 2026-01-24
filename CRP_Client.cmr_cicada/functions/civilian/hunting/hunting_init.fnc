
{
    _x addAction["Process Cow into Steak","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawcow_tagged","beef_steak",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Cow into Burger","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawcow_tagged","beef_burger",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Cow into Jerky","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawcow_tagged","beef_jerky",3], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Goat into Curry","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawgoat_tagged","goat_curry",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Goat into Stew","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawgoat_tagged","goat_stew",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Rabbit into Stew","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawrabbit_tagged","rabbit_stew",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Rabbit into Pie","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawrabbit_tagged","rabbit_pie",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Sheep into Lamb Chops","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawsheep_tagged","lamb_chops",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Sheep into Lamb Roast","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawsheep_tagged","lamb_roast",3], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Boar into Sausage","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawboar_tagged","boar_sausage",2], 25, false, true, "LeanRight","player distance _target < 10"];
    _x addAction["Process Boar into Ribs","noscript.sqf",format["[%1,%2,%3]spawn hunting_processLegal","rawboar_tagged","boar_ribs",3], 25, false, true, "LeanRight","player distance _target < 10"];
   
    _x addAction["Process Untagged Cow into Steak","noscript.sqf",format["[%1,%2,%3]spawn hunting_processIllegal","rawcow","beef_steak",2], 25, false, true, "LeanRight","dtk_civ && {player distance _target < 10}"];
    _x addAction["Process Untagged Goat into Curry","noscript.sqf",format["[%1,%2,%3]spawn hunting_processIllegal","rawgoat","goat_curry",2], 25, false, true, "LeanRight","dtk_civ && {player distance _target < 10}"];
    _x addAction["Process Untagged Rabbit into Stew","noscript.sqf",format["[%1,%2,%3]spawn hunting_processIllegal","rawrabbit","rabbit_stew",2], 25, false, true, "LeanRight","dtk_civ && {player distance _target < 10}"];
    _x addAction["Process Untagged Sheep into Lamb Chops","noscript.sqf",format["[%1,%2,%3]spawn hunting_processIllegal","rawsheep","lamb_chops",2], 25, false, true, "LeanRight","dtk_civ && {player distance _target < 10}"];
    _x addAction["Process Untagged Boar into Sausage","noscript.sqf",format["[%1,%2,%3]spawn hunting_processIllegal","rawboar","boar_sausage",2], 25, false, true, "LeanRight","dtk_civ && {player distance _target < 10}"];
    
    [("game_processing_" + str _forEachIndex),getPos _x,nil,nil,"ColorOrange","mil_dot",[1,1],"Game Processing"]call core_createMarkerLocal;
        
} forEach nearestObjects[dtk_center, ["Land_HouseV_3I3"], (dtk_center select 0)];


