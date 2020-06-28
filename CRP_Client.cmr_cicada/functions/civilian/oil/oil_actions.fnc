if (dtk_server)exitWith {};

{
	_x setVehicleVarName format ["drill_%1",_forEachIndex];
	missionNamespace setVariable [format ["drill_%1",_forEachIndex],_x];
	_x addaction ["","functions\items\mine.sqf",'oil', 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'Drill For Oil (E)','\crp_data\images\tags\oil']call tag_show)}",_img,_text]];
}ForEach nearestobjects [dtk_center, ["Land_Ind_Oil_Pump_EP1","Land_Ind_Oil_Tower_EP1"], (dtk_center select 0)];

DTK_Shop_Oil_1 addaction ["","scripts\itemprocess.sqf",["Oil", "OilBarrel", 2,"DTK_License_civ_oil"], 25, false, true, "LeanRight",format ["player distance _target < 5 && {!([_target,'Process Oil (E)','\crp_data\images\tags\oil']call tag_show)}","",""]];
["oil_mrk",getPos DTK_Shop_Oil_1,nil,nil,"colorBlack","mil_dot",nil,"Process Oil"]call core_createMarkerLocal;