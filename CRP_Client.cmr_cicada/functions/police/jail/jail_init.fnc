if(dtk_server)exitWith {};

DTK_Shop_JailFood addaction ["Pay Bail","noscript.sqf","createDialog 'baildialog';", 1, false, true, "","true"];

["Jail_mrk",[7115.88,3575.86,0.00137711],nil,nil,"ColorBlack","mil_box",nil,"Jail"]call core_createMarkerLocal;