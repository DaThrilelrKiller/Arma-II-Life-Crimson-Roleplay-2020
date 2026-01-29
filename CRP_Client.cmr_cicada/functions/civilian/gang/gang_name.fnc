private ["_gangs","_return","_Members","_name","_playname"];
_gangs = gangs getVariable ["Names",[]];
_return = "";

{
	_Members = gangs getVariable [_x,[]];
	_name = _x;
	
	/* search gangs for player */
	{
		_playname = _x select 0;
		if (name player == _playname)then {_return = _name};
	}forEach _Members;

}forEach _gangs;
_return

