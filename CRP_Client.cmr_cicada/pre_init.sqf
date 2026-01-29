OL_FNC_GETSERVERINFO = [0,0,0,0];

diag_log text "[LOG]Pre Initialization started!";
dtk_client = hasInterface;
dtk_server = !dtk_client;

if (dtk_server)then {
	call compile preprocessFile '\MPMissions\mission.sqf';
}else{
	[]execVM "skipBriefing.sqf";
};

call compile preprocessFile "spawn_points.sqf";
call compile preprocessFile "scripts\admin.sqf";
call compile preprocessFile  "scripts\miscfunctions.sqf";
call compile preprocessFile "configuration\CfgMaster.sqf";

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
"Experience",
"Spawn",
"TFAR"
];

call compile preprocessFile "variables.sqf";
call compile preprocessFile "functions.sqf";

if (dtk_server)then {
	call compile preprocessFile "\MPMissions\functions\pre_init.sqf";
};


diag_log formatText ["Total Modules: %2 Total Functions: %1",dtk_fnc_total,count dtk_active_modules];
diag_log text "[LOG]Pre Initialization finished!";
