private ["_ems","_building"];

_ems = ["a2l_firefighter1","a2l_firefighter","hazmatRed","hazmatYellow"]call core_typeOnline;
if (_ems > 1 && {[40]call Main_Random})then {
	_building  = nearestBuilding (getPos _this);
	["SERVER",_building,"s_ems_fire",false,false]call network_MPExec;
	
	["ALL",[],{
		if (dtk_cop || {dtk_emd})then {
			systemchat "A Drug lab has cought fire! Police, Fire, and EMS units requested to responded! Check your map";
			playSound "beepsimple";
		};
	},false,false]call network_MPExec;
	systemchat "You lab has caught fire, do your calculations better next time!";
	
};