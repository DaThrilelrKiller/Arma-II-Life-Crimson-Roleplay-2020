private ["_gang","_members","_index","_name"];

/* grab current player gang */
_gang =  player call gang_name;
_members = gangs getVariable [_gang,[]];

/* find player index within gang member list */
_index = 
{
	_name = _x select 0;
	if (name player == _name)exitWith {_ForEachIndex};
}forEach _members;

/* remove the bitch */
_members set [_index,""];
_members = _members - [""];

/* set the variable to make sure the bitch is gone */
gangs setVariable [_gang,_members,true];

["SERVER",_gang,"s_gang_save",false,false]call network_MPExec;

systemchat format ["You have left %1",_gang];

closeDialog 0;
call gang_open;