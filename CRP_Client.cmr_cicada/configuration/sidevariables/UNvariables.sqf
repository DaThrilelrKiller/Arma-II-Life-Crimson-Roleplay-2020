dtk_civ         	= false;						
dtk_cop          	= false;	
iscop = false;
dtk_ems       	= true;	
dtk_sidename = "Emergency Medical Service";

USBW_Interactions = [
["'Enable License Plate'",'!ar_plates','[]spawn plates_plate'],
["'Disable License Plate'",'ar_plates','[]spawn plates_plate']
];


INV_apps = [
["app_warrants","data\images\ipad\warrants.PAA","[0,1,2,[""coplog""]] execVM 'scripts\maindialogs.sqf';"],
["app_civilian","data\images\ipad\players.PAA","[0,0,0,[""playerlist""]] execVM 'scripts\maindialogs.sqf';"],
["app_oil","data\images\ipad\OIL.PAA","[0,0,0,[""oilswag""]] execVM 'scripts\maindialogs.sqf'"],
["app_dmv","data\images\ipad\licences.PAA","[player]call licenses_check"],
["app_laws","data\images\ipad\LAWS.PAA","[0,0,0,[""lawswag""]] execVM 'scripts\maindialogs.sqf';"],
["app_gangs","data\images\ipad\gangs.PAA","closeDialog 0;call gang_open"],
["app_stockmarket","data\images\ipad\stockmarket.PAA","[0,0,0,[""fundsswag""]] execVM ""scripts\maindialogs.sqf"";"],
["app_store","data\images\ipad\store.PAA","[(BuildingCollapesLogic call shops_index)]call shops_open; "],
["app_credit","data\images\ipad\store.PAA","closeDialog 0;call credit_open"],
["app_settings","data\images\ipad\controls.PAA","call keypress_menu"],
["app_background","data\images\ipad\background.PAA","call ipad_background"],
["app_vote","data\images\ipad\vote.PAA","call goverment_vote"]
];

AppStoreArray = {
[
"app_phone",
"app_warrants",
"app_civilian",
"app_oil",
"app_dmv",
"app_laws",
"app_gangs",
"app_stockmarket",
"app_credit"
];
};
