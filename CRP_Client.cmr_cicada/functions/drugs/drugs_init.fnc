
if (dtk_server)exitWith {};

methlab addAction ["Process Meth","scripts\itemprocess1.sqf",["pharm", "meth", 2],1,false,true,"LeanRight","dtk_civ && {player distance _target < 5} && {!([_target,'Process Meth (E)','\crp_data\images\tags\meth']call tag_show)}"];
methlab2 addAction ["Process Meth","scripts\itemprocess1.sqf",["pharm", "meth", 2],1,false,true,"LeanRight","dtk_civ && {player distance _target < 5}< 5 && {!([_target,'Process Meth (E)','\crp_data\images\tags\meth']call tag_show)}"];

["methlab1_mrk",getPos methlab,nil,nil,"colorRed","mil_dot",nil,"Meth Lab"]call core_createMarkerLocal;
["methlab2_mrk",getPos methlab2,nil,nil,"colorRed","mil_dot",nil,"Meth Lab"]call core_createMarkerLocal;