if (dtk_server)exitWith {};
["chop_mrk",getPos chopshop,nil,nil,"colorRed","mil_dot",nil,"Chop Shop"]call core_createMarkerLocal;
chopshop addaction ["","noscript.sqf","[]spawn chop_Vehicle;", -1, false, true, "LeanRight","!([_target,'Chop Vehicle(E)','data\images\chop']call tag_show)"];
