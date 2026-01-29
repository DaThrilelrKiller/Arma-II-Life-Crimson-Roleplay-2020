private ["_to"];
_to = _this select 0;

if (typeName _to == "STRING" && {_to == "ALL"})then
{
	[_to,[],compile ctrlText 1400,false,true]call network_MPExec;
}
else
{
	[_to,[],compile ctrlText 1400,false,false]call network_MPExec;
};

v_admin_recents set [count v_admin_recents,ctrlText 1400];
profileNameSpace setVariable ["v_admin_recents",v_admin_recents];
[]call admin_console_recents;

[player,format['executed %1 in the console',ctrlText 1400],[0.94,0.61,0,1]]call admin_logs_add;