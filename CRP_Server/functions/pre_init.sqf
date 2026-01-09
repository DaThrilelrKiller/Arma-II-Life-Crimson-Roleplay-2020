private ["_modules","_functions"];
PG_SSF = [];

dtk_server_modules = 
[
"Map",
"Stats",
"Robbery",
"Network",
"Gang",
"Impound",
"Core",
"Fishing",
"Disconnect",
"Hunting",
"Zone",
"Whitelist",
"Accidents",
"EMS",
"House",
"Drug",
"Vault",
"Gallery",
"Lab",
"Vehicle",
"Civilians",
"OwlEye"
];

/*loads module functions*/ 
{
	call compile preprocessFile format ["\MPMissions\functions\%1\_module.variables", _x ];
	_functions = call compile preprocessFile format["\MPMissions\functions\%1\_module.functions", _x];
	_module = _x;
	{
		_name = _x select 0;
		_client = _x select 1;
		if (_name in DTK_Events && {_module != "Setup"})then {	
			_array = missionNamespace getVariable [format["DTK_%1",_name],[]];
			_array = _array + [compile preprocessFile format["\MPMissions\functions\%1\%1_%2.fnc",_module,_name]];
			missionNamespace setVariable [format["DTK_%1",_name],_array];
		}else{
			if (_client)then
			{
				call compile format['%1_%2 = compile preprocessFile "\MPMissions\functions\%1\%1_%2.fnc";PG_SSF set[count PG_SSF,"%1_%2"];',_module,_name];
			}
			else
			{
				call compile format['S_%1_%2 = compile preprocessFile "\MPMissions\functions\%1\%1_%2.fnc";',_module,_name];
			};
		};
	}forEach _functions;
}count dtk_server_modules;