_names = ["Gangs", "Names", "Names",[]]call S_stats_read;

{
	_locked = ["Gangs", _x, "locked",false]call S_stats_read;
	_members = ["Gangs", _x, "members",[]]call S_stats_read;
	
	if (count _members > 0)then {
		gangs setVariable [format["%1_locked",_x],_locked,true];
		gangs setVariable [_x,_members,true];
	}else{
		_names = _names - [_x];
	};
}foreach _names;

gangs setVariable ["Names",_names,true];
