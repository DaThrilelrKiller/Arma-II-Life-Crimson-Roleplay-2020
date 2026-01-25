if (dtk_server)exitWith {};

donutguy addaction ["Buy Donut", "noscript.sqf", '[1,125] call donuts_buy;', 1, false, true, "", ""];
donutguy addaction ["Buy Half Dozen Donuts", "noscript.sqf", '[6,750] call donuts_buy;', 1, false, true, "", ""];
donutguy addaction ["Buy Dozen Donuts", "noscript.sqf", '[12,1500] call donuts_buy;', 1, false, true, "", ""];
donutguy2 addaction ["Buy Donut", "noscript.sqf", '[1,125] call donuts_buy;', 1, false, true, "", ""];
donutguy2 addaction ["Buy Half Dozen Donuts", "noscript.sqf", '[6,750] call donuts_buy;', 1, false, true, "", ""];
donutguy2 addaction ["Buy Dozen Donuts", "noscript.sqf", '[12,1500] call donuts_buy;', 1, false, true, "", ""];
  
["donutguy_mrk",getPos donutguy,nil,nil,"colorOrange","mil_dot",nil,"East Dunkin Donuts"]call core_createMarkerLocal;
["donutguy2_mrk",getPos donutguy2,nil,nil,"colorOrange","mil_dot",nil,"West Dunkin Donuts"]call core_createMarkerLocal;
