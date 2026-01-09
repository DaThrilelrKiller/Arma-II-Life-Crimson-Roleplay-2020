rathaus addaction ["Change The Laws","scripts\maindialogs.sqf",["gesetz"],1,false,true,""," (call goverment_govonor == player)"];
rathaus addaction ["Change The Taxes","scripts\maindialogs.sqf",["steuern"],1,false,true,""," (call goverment_govonor == player)"];
rathaus addaction ["","noscript.sqf",'call goverment_vote;',25,false,true,"LeanRight","player distance _target < 5 && {!([_target,'Vote(E)','data\images\misc\bank']call tag_show)}"];
["mrk_Vote_1",getPos rathaus,nil,nil,"colorBlack","mil_dot",nil,"Voting Booth"]call core_createMarkerLocal;
