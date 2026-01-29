if (dtk_server)exitwith{};

impoundbuy addaction ["","noscript.sqf","[]call impound_open;", 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'Impound Lot (E)','data\images\tags\car']call tag_show)}","",""]];
["mrk_impound_1",getPos impoundbuy,nil,nil,"colorWhite","mil_dot",nil,"Impound Lot"]call core_createMarkerLocal;
