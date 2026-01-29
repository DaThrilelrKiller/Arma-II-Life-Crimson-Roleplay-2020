INV_drogenusesperre = 0;
INV_drogen_usesperre = FALSE;
INV_DrogenCounter = 0;

/*Main*/
pickingup   		 = false;
spamcount = 0;

AR_playerString = str player;
dtk_towers = ["il_towtruck","oldtruck","datsun1_civil_3_open","oltruc3","Pickup_PK_TK_GUE_EP1","f350_red","f350_black","f350_blue","f350_pink","f350_white","il_silverado_black","il_silverado_red","il_silverado_orange","il_silverado_selvo","il_silverado_white","il_silverado_pd","lcu"];

/*Fishing Arrays*/
INV_FarmItemArray =
[
[[["lsdfield",30]],"Unprocessed_lsd",15,4,["Man"]],
[[["lsdfield_1",30]],"Unprocessed_lsd",15,4,["Man"]], 
[[["cocainefield_4_1",30]],"Unprocessed_cocaine",20,9,["Man"]],
[[["herionfield_2",30]],"Unprocessed_Heroin",20,9,["Man"]],

[[["DiamondArea",20]],"Diamond rock",15,1,["Man"]],
[[["farmarea2",90]],"getreide",20,10,["tractor","oldtruc2","oldtruc2a"]],
[[["farmarea3",90]],"getreide",20,10,["tractor","oldtruc2","oldtruc2a"]],
[[["sandarea",70]],"sand",15,5,["Man"]],
[[["sandarea1",70]],"sand",15,5,["Man"]],
[[["apfelfeld1",50]],"apple",10,5,["Man"]]
];
Miningarray =
[
	[["IronArea",30],"iron",12],
	[["GoldArea",15],"gold",12],
	[["GoldArea1",15],"gold",12],
	[["CopperArea",30],"copper",12],
	[["CopperArea1",30],"copper",12]
];

workplacejob_assassin_break   = 10;
workplacejob_assassion_failed = false;
workplacejob_hostage_break   = 5;
workplacejob_hostage_failed = false;


/*Other*/
lockpicking = false;
isstunned                = false;
CivTimeInPrison          = 0;
isCrackingSafe			 = 0;
safeCrackFailed			 = 0;
StunActiveTime           = 0;
StunTimePerHit		 = 15;
MaxStunTime		 = 30;
bc_baitcars = [];
stolenfromtime 		 = 900;
stolenfromtimeractive	 = false;
Safecracked1 = False;
pmissionactive = false;
patrolwaittime = false;
patrolmoneyperkm = 0.20;
wantedamountforbank = 2000;
oilsellpricedec          = 30;
oilbaseprice		 = 300;
working=false;
coppatrolarray  = [[4045.69,2284.16,0],[3661.66,4261.21,0],[4169.17,3648.72,0],[2918,3514.07,0],[1139.32,4564.22,0],[1112.11,3782.8,0],[3025.85,4435.61,0],[2190.9,4489.62,0],[2429.91,4768.43,0],[904.459,1176.82,0],[1578.37,4739.66,0],[1972.94,4290.42,0],[1523.08,4389.92,0],[2570.85,3779.43,0],[2846.55,1488.14,0],[1483.26,2539.71,0],[727.739,2934.53,0],[1563.24,4871.82,0],[2520.61,4665.69,0]];
SigningUpForDebitCard	 = false;
slave_cost               = 500;
HideoutLocationArray     = [];
doingSomething            = false;
nonlethalweapons	 = ["","Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];

processscriptrunning = 0;
