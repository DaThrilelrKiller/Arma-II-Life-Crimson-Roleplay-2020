OL_FNC_GETSERVERINFO = [0,0,0,0];

diag_log text "[LOG]Pre Initialization started!";
// Prevent accidental double-execution (some missions call pre_init.sqf from an object init AND from init.sqf).
if (!isNil "DTK_PreInitRan") exitWith {
	diag_log text "[LOG]Pre Initialization skipped (already ran)";
};
DTK_PreInitRan = true;

dtk_client = hasInterface;
dtk_server = !dtk_client;

// Define side flags early so config compilation can't explode on undefined vars (Arma 2 OA is strict here).
if (isNil "dtk_cop") then { dtk_cop = false; };
if (isNil "dtk_ems") then { dtk_ems = false; };
if (isNil "dtk_civ") then { dtk_civ = false; };

if (dtk_server)then {
	call compile preprocessFile '\MPMissions\mission.sqf';
}else{
	[]execVM "skipBriefing.sqf";
};

call compile preprocessFile "spawn_points.sqf";
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
["Core","Credit"],

"Police",
["Police","ID"],
["Police","Cdb"],
["Police","Plates"],
["Police","Cuffs"],
["Police","Dog"],
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
"Court",
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
"Experience",
"Spawn",
"TFAR"
];

// Client-only: the dedicated server uses its own loader at `\MPMissions\functions\pre_init.sqf`.
// Running the client loader on the server spams "script not found" warnings and isn't needed.
if (dtk_client) then {
	call compile preprocessFile "variables.sqf";
	call compile preprocessFile "functions.sqf";
};

if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\pre_init.sqf";

	// Arma 2 OA does NOT auto-run `InitServer.sqf` (that's an Arma 3 feature).
	// Clients wait on `server_auth` in `init.sqf`, so publish it from here once the server is alive.
	[] spawn {
		waitUntil { time > 0 };
		if (isNil "server_auth") then {
			server_auth = true;
			publicVariable "server_auth";
			diag_log text "[LOG]Server authentication published (server_auth=true)";
		};
	};
};


diag_log formatText ["Total Modules: %2 Total Functions: %1",dtk_fnc_total,count dtk_active_modules];
diag_log text "[LOG]Pre Initialization finished!";
