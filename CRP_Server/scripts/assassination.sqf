_secondcounter = 0;
_minutecounter = 0;
_art = (_this select 3) select 0;

if (_art == "getajob_assassin") then 

{

if !(isNil "VIPtarget" || {isNull VIPtarget})exitWith {systemChat  "There are currently no targets that require assassination.";};

if(workplacejob_assassion_failed)exitWith{systemChat  "You have failed an assassination recently, maybe you'll be hired again later.";};

_array  = [[VIPspawn1, 10], [VIPspawn2, 10], [VIPspawn3, 10]];
_city   = (floor(random(count _array)));						
_pos    = (_array select _city) select 0;
_radius = (_array select _city) select 1;
_a1	= 0;

deletemarker "targetmarker";
deletevehicle VIPtarget;
deletevehicle assveh;
deletevehicle VIPbodyguard1;
deletevehicle VIPbodyguard2;

_group = createGroup west;
VIPtarget = _group createUnit ["Functionary1_EP1", _pos, [], _radius, "FORM"]; 
VIPtarget setvehicleinit 'VIPtarget = this;this setVehicleVarName "VIPtarget";';
VIPtarget addweapon "RH_M4";
VIPtarget addweapon "M9";
VIPtarget addmagazine "30Rnd_556x45_Stanag";
VIPtarget addmagazine "30Rnd_556x45_Stanag";
VIPtarget addmagazine "30Rnd_556x45_Stanag";
VIPtarget addmagazine "30Rnd_556x45_Stanag";
VIPtarget addmagazine "30Rnd_556x45_Stanag";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";

VIPbodyguard1 = _group createUnit ["Functionary2_EP1", _pos, [], _radius, "FORM"];
VIPbodyguard1 setvehicleinit 'VIPbodyguard1 = this;this setVehicleVarName "VIPbodyguard1";';
VIPbodyguard1 addweapon "m9";
VIPbodyguard1 addweapon "RH_M4";
VIPbodyguard1 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard1 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard1 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard1 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard1 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";

VIPbodyguard2 = _group createUnit ["Functionary2_EP1", _pos, [], _radius, "FORM"];
VIPbodyguard2 setvehicleinit 'VIPbodyguard2 = this;this setVehicleVarName "VIPbodyguard2";';
VIPbodyguard2 addweapon "m9";
VIPbodyguard2 addweapon "RH_M4";
VIPbodyguard2 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard2 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard2 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard2 addmagazine "30Rnd_556x45_Stanag";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";



processInitCommands;

assveh = createVehicle ["CHRYSLER_B_limmo", _pos, [] , 3, "NONE"];
assveh setVehicleInit
"assveh = this;
this setVehicleVarName ""assveh"";
this setVehicleLock ""locked"";
this setAmmoCargo 0;
  ";

processInitCommands;

if ((!(VIPtarget in assveh)) and (alive VIPtarget))
	then{
		VIPbodyguard1 moveInDriver assveh;
		VIPtarget doFollow VIPbodyguard1;
		VIPbodyguard2 doFollow VIPbodyguard1;
		
		VIPtarget moveInCargo assveh;
		VIPbodyguard2 moveInCargo assveh;
	};

_markerobj = createMarker ["targetmarker",[0,0]];																				
_markername= "targetmarker";																														
_markerobj setMarkerShape "ICON";								
"targetmarker" setMarkerType "Marker";										
"targetmarker" setMarkerColor "ColorRed";																														
"targetmarker" setMarkerText "Assassination target";								
_markername SetMarkerPos _start;
															
systemChat  "The VIP target has been marked on the map. Kill him before the police can take him to safety.";

"if (dtk_cop) then {player sideChat ""Someone is trying to kill a government VIP. The target has been marked on the map. Rescue the target before its too late!""};" call network_broadcast;

systemChat  "The police are on to you and the VIP knows your coming, hurry up!";
[player,"Assassin",50000]call cdb_addWarrant;
VIPtarget domove getmarkerpos "policebase";
while {true} do 

	{
	"if(alive player and dtk_civ and player distance assveh <= 150)then{titleText [""The Government is operating in this area! Turn back or you will be shot!"", ""plain down""]};" call network_broadcast;
	"targetmarker" setmarkerpos getpos VIPtarget;
	if (_secondcounter >= 15) then
		{
		_group setBehaviour "AWARE";
		_group setSpeedMode "NORMAL";
		VIPtarget domove getmarkerpos "policebase";
		_secondcounter = 0;
		};
		
	if (_minutecounter >= 1200) exitWith
	
		{
		"systemChat ""Assassination mission not completed within 20mins the mission has ended."";" call network_broadcast;
		sleep 3;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;
		_minutecounter = 0;
		};
				
	if (!alive VIPtarget and alive player) exitWith 
	
		{
			
		dtk_bank = dtk_bank + 100000;
		systemChat  "Well done. Target elimated. $100000 has been transfered to your account.";
		sleep 10;
		"systemChat ""The VIP target has been killed!"";" call network_broadcast;
		[player,"Assassinated VIP",25000]call cdb_addWarrant;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;
		
		};

	if(VIPtarget distance getmarkerpos "policebase" < 100) exitwith

		{

		"
		systemChat ""The VIP target has been rescued!"";
		_copplayernumber = playersNumber west;
		_copbonus = 40000;
		if (dtk_cop) then {dtk_bank = (dtk_bank + _copbonus); player sidechat format[""you received $%1 for the successful rescue of the VIP"", _copbonus];};
		" call network_broadcast;
		sleep 2;
		systemChat  "The vip was rescued, mission failed!";
		workplacejob_assassion_failed = true;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;
		
		};
	_minutecounter = _minutecounter + 1;
	_secondcounter = _secondcounter + 1;
	sleep 1;

	};
deletevehicle VIPtarget;
deletemarker "targetmarker";
deletevehicle assveh;
deletevehicle VIPbodyguard1;
deletevehicle VIPbodyguard2;																				
sleep ((workplacejob_assassin_break)*60);			

if (workplacejob_assassion_failed) then 

	{

	sleep ((workplacejob_assassin_break)*60);
	workplacejob_assassion_failed = false;	

	};

};