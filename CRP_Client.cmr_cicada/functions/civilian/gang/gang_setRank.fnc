
private ["_rank","_gang","_members","_info","_name","_data"];

/* grab needed info */
_rank = (ctrlText 5);
_who = call compile lbData[2,(lbCurSel 2)];
_who = _who select 1 select 0;
_who =  ([_who," "] call string_split)select 0;
_gang = player call gang_name;
_members = gangs getVariable [_gang,[]];


_info = 
{
	_name = _x select 0;
	if (_who == _name)exitWith {[_forEachIndex,_x]};
}forEach _members;

/* set the index to new info and save */
_index = _info select 0;
_data = _info select 1;
_data set [1,_rank];
_members set [_index,_data];

gangs setVariable [_gang,_members,true];

["SERVER",_gang,"s_gang_save",false,false]call network_MPExec;

closeDialog 0;
call gang_open;



