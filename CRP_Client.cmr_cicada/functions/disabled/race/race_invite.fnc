
_unit = _this select 0;

if (!isNil "_unit")then {
	[_unit,[player],"race_invite",false,false]call network_MPExec;
};

systemchat format ["%1 Invited you to a race,Accept the race at the starting line",name _unit];
dtk_races = set[count dtk_races,[_racer,_location,_time]];

