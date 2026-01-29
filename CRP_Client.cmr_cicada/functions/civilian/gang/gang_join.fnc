private ["_gang","_locked","_members"];

/* grab data */
_gang = lbData [2, lbCurSel 2];
_locked = gangs getVariable [format["%1_locked",_gang],false];


/* check if gang is lock or if you have a invite to bypass the lock */
if (_locked && {!(_gang in dtk_gang_invites)})exitWith {systemchat format ["%1 is not accepting people at this time",_gang]};


/* join the gang bitch */
_members = gangs getVariable [_gang,[]];

if (count _members >= DTK_GangLimit)exitWith {
	systemchat format ["%1 has reached their limit of %2 members",_gang,DTK_GangLimit];
};

_members set[count _members,[name player,"Recruit"]];
gangs setVariable [_gang,_members,true];

["SERVER",_gang,"s_gang_save",false,false]call network_MPExec;

systemchat format ["You have joined %1",_gang];

closeDialog 0;
call gang_open;
dtk_gang_invites = [];