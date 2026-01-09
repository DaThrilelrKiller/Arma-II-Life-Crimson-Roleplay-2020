private ["_unit","_cuffed"];

if (player getVariable ["ar_cuffed",false])exitWIth {
	systemchat format["%1 you can not use cuffs while your cuffed",name player];
};

_unit = (nearestObjects [getpos player,["Man"],2] select 1);
_cuffed = _unit getVariable ["ar_cuffed",false];


if (!_cuffed)then{
	player say "handcuff";
	["ALL",[_unit,"actspercmstpsnonwrfldnon_interrogate02_forgoten"],"network_SwitchMove",false,true]call network_MPExec;
	_unit setVariable ["ar_cuffed",true,true];
	[player,format['cuffed %1',name _unit],[0.95,0.88,0,1]]call admin_logs_add;
	[_unit,_unit,"cuffs_cuffloop",true,false]call network_MPExec;
} else {
	_unit setVariable ["ar_cuffed",false,true];
	detach _unit;
};