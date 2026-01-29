private ["_gang","_locked","_members"];

_gang = _this;
_names = gangs getVariable ["Names",[]];

_locked = gangs getVariable [format["%1_locked",_gang],false];
_members = gangs getVariable [_gang,[]];
	
["Gangs",
	[
		["Names", "Names", _names], 
		[_gang, "locked", _locked], 
		[_gang, "members", _members]
	]
]call S_stats_update;









