_time = round (sliderPosition 11);

if (player distance [7117.99,3589.76,0] > 20) exitWith {
	systemchat"You are not close enough to jail to perform a arrest";
};

if !(dtk_unit call ISSE_IsVictim)exitWith {
	systemchat "Player does not have his hands up, is not stunned, or restrained.";
};

_bounty = dtk_unit call cdb_bounty;
if (_bounty != 0)then {
	dtk_bank = dtk_bank + _bounty;
	dtk_unit setVariable ['cdb_warrants',[],true];
};

["ALL",["dtk_client",format["%1 was arrested by %2 for %3 minute(s)",name dtk_unit,name player,_time call string_intToString],1],"network_chat",false,true]call network_MPExec;
[dtk_unit,[dtk_unit,player,_time],"jail_handler",true,false]call network_MPExec;
closeDialog 0;