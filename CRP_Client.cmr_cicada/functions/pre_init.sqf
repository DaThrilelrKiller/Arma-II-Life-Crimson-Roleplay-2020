OL_FNC_GETSERVERINFO = [0,0,0,0];

diag_log text "[LOG]Pre Initialization started!";
dtk_client = hasInterface;
dtk_server = !dtk_client;

if (dtk_server)then {
	call compile preprocessFile '\MPMissions\mission.sqf';
}else{
	[]execVM "skipBriefing.sqf";
};

call compile preprocessFile "functions\spawn_points.sqf";
call compile preprocessFile "configuration\CfgFunctions.fnc";
call compile preprocessFile "scripts\admin.sqf";
call compile preprocessFile  "scripts\miscfunctions.sqf";
call compile preprocessFile "configuration\CfgMaster.sqf";
call compile preprocessFile "configuration\CfgShops.sqf";

private ["_modules","_functions","_path"];
dtk_fnc_total = 0;

DTK_Events = [
"init",
"jip",
"fired",
"respawn"
];

dtk_active_modules = 
[
["Core","Network"],
["Core","Music"],
["Core","Core"],
["Core","Whitelist"],
["Core","Stats"],
["Core","Settings"],
["Core","Action"],
["Core","Keypress"],
["Core","Config"],
["Core","Array"],
["Core","BIS"],
["Core","Storage"],
["Core","Shops"],
["Core","Licenses"],
["Core","Roads"],
["Core","Chat"],
["Core","String"],
["Core","Locations"],
["Core","Setup"],
["Core","ATM"],
["Core","Fuel"],
["Core","Gear"],
["Core","Keys"],
["Core","Garage"],
["Core","Dance"],
["Core","Hunger"],
["Core","Tag"],
["Core","Hud"],
["Core","Log"],

"Police",
["Police","ID"],
["Police","Cdb"],
["Police","Plates"],
["Police","Cuffs"],
["Police","Dog"],
["Police","Ticket"],
["Police","Jail"],
["Police","Speedcam"],
["Police","Flashbang"],
["Police","Fingerprints"],

["Civilian","Shipment"],
["Civilian","Taxi"],
["Civilian","Bank"],
["Civilian","Robbery"],
["Civilian","Oil"],
["Civilian","Zone"],
["Civilian","Slots"],
["Civilian","Gang"],
["Civilian","Fishing"],
["Civilian","Lotto"],
["Civilian","Hunting"],
["Civilian","Factory"],
["Civilian","Drug"],
["Civilian","Chop"],
["Civilian","Vault"],
["Civilian","CodePad"],
["Civilian","Lab"],
["Civilian","Gallery"],

"EMS",
["EMS","Fire"],
["EMS","Spill"],
["EMS","Gas"],

"Items",
"Groups",
"Paint",
"Goverment",
"Dealer",
"Impound",
"Markers",
"Siren",
"Checkpoint",
"Admin",
"Holster",
"Quest",
"Medical",
"Ipad",
"Clothing",
"GPS",
"Vehicle",
"Killfeed",
"Mounted",
"Gates",
"House",
"Tower",
"Drugs",
"Donuts",
"Spawn",
"TFAR"
];

/*loads module functions*/
{
	_module = _x;
	
	if (typeName _module == "ARRAY")then{
		_path = format["%1\%2",_module select 0,_module select 1];
		_module = _module select 1;
	}else{
		_path = _module;
	};
	
	call compile preprocessFile format["functions\%1\_module.variables",_path];
	_functions = call compile preprocessFile format ["functions\%1\_module.functions",_path];
	
	
	{
		if (_x in DTK_Events && {_module != "Setup"})then {
			_array = missionNamespace getVariable [format["DTK_%1",_x],[]];
			
			if (_x == "init")then {
				_array = _array + [[compile preprocessFile format["functions\%3\%1_%2.fnc",_module,_x,_path],_module]];
			}else{
				_array = _array + [compile preprocessFile format["functions\%3\%1_%2.fnc",_module,_x,_path]];
			};
			missionNamespace setVariable [format["DTK_%1",_x],_array];

		}else{
			_fn = format ["%1_%2",_module,_x];
			missionNamespace setVariable [_fn,compile preprocessFile format["functions\%1\%2.fnc",_path,_fn]];
		};
		dtk_fnc_num = _forEachIndex + 1;
	}forEach _functions;
	diag_log formatText ["Loaded Module - %1 With %2 Functions",_module,dtk_fnc_num];
	dtk_fnc_total = dtk_fnc_total + dtk_fnc_num;
}count dtk_active_modules;

if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\pre_init.sqf";
};


diag_log formatText ["Total Modules: %2 Total Functions: %1",dtk_fnc_total,count dtk_active_modules];
diag_log text "[LOG]Pre Initialization finished!";
