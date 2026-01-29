
rathaus addAction ["Crime Log","scripts\maindialogs.sqf",["coplog"],1,false,true,"","true"];
DTK_Shop_PawnShop addAction["Process Diamond","scripts\itemprocess.sqf",["diamond rock", "diamond",5],1,false,true,"","true"];
DTK_Shop_Bakery addAction["Process Wheat","scripts\itemprocess.sqf",["getreide", "Bread", 2],1,false,true,"","true"];
DTK_Shop_Bakery addAction["Process Strawberries","scripts\itemprocess.sqf",["straw", "Frozens", 3],1,false,true,"","true"];
DTK_ATM_BANK addAction["Sign-up For A Debit Card","scripts\debitcardsignup.sqf",["mainbank"],1,false,true,"","!SigningUpForDebitCard"];
atm12 addAction["Get Assassination Job","scripts\assassination.sqf",["getajob_assassin"],1,false,true,"","true"];
atm12 addAction["Switch To Assassin Clothes","noscript.sqf",'["TK_INS_Soldier_EP1"] call clothing_switch;',1,true,true,"",'("assassinlic" call licenses_has)'];
hostage addAction["Take Hostage Mission","scripts\hostage.sqf",["getajob_hostage"],1,false,true,"","dtk_civ"];
hostage1 addAction["Take Hostage", "noscript.sqf", "[hostage1] join (group player); systemChat  ""Keep the hostage close or you will fail!"";",1,false,true,"","dtk_civ"];
