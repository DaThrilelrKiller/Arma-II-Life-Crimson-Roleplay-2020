if (dtk_server)exitWith {};

DTK_Shop_Taxi addAction["Get A Taxi Job","noscript.sqf","[]spawn taxi_handler",1,false,true,"","dtk_civ"];
DTK_Shop_Taxi addAction["Finish My Taxi Mission","noscript.sqf","taxi_active = false; systemchat 'You have left the taxi service';",1,false,true,"","workplacejob_taxi_active"];
