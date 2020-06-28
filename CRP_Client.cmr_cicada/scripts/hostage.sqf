_secondcounter = 0;
_minutecounter = 0;
_art = (_this select 3) select 0;

if (_art == "getajob_hostage") then 

{
_west = playersNumber west;

if !(isNil "hostage1" || {isNull hostage1})exitWith {systemChat  "There Are Currently No More Hostages!";};

if(workplacejob_hostage_failed)exitWith{systemChat  "You Have Failed A Hostage Mission Recently, Maybe You Can Do It Again Later!";};

_array  = [[Hostagespawn1, 1], [Hostagespawn2, 1]];
_city   = (floor(random(count _array)));						
_pos    = (_array select _city) select 0;
_radius = (_array select _city) select 1;
_a1	= 0;


deletemarker "htargetmarker";
deletevehicle hostage1;



_group = createGroup east;
hostage1 = _group createUnit ["Functionary1_EP1", _pos, [], _radius, "FORM"]; 
hostage1 setvehicleinit 'hostage1 = this;this setVehicleVarName "hostage1";';

processInitCommands;

_markerobj = createMarker ["htargetmarker",[0,0]];																				
_markername= "htargetmarker";																														
_markerobj setMarkerShape "ICON";								
"htargetmarker" setMarkerType "Marker";										
"htargetmarker" setMarkerColor "ColorRed";																														
"htargetmarker" setMarkerText "Hostage target";								
_markername SetMarkerPos _start;
																
systemChat  "The Hostage Is Marked On The Map, Don't Let The Police Get You!";

"if (dtk_cop) then {player sideChat ""Someone Is Trying To Take A Hostage. The Hostage Has Been Marked On The Map. Arrest The Hostage Taker Before Its Too Late!""};" call network_broadcast;

systemChat  "The Police Are On To You, Hurry Up!";
[player,"Hostage Taker",150000]call cdb_addWarrant;


while {true} do 

	{

	"htargetmarker" setmarkerpos getpos hostage1;
	
		
	if (_minutecounter >= 1800 and alive player) exitWith
	
		{
		dtk_bank = dtk_bank + 500000;
		systemChat  "Well done, you kept the hostage for 30 minutes, $500000 has been transfered to your account.";
		sleep 10;
		"systemChat ""Hostage Taker WINS, he kept the hostage for 30 minutes."";" call network_broadcast;
		sleep 1;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
		_minutecounter = 0;
		};
				
	if (!alive hostage1 and alive player) exitWith 
	
		{
			
		systemChat  "Hostage Has Been Killed, No One Wins!!";
		sleep 5;
		"systemChat ""The Hostage Has Been Killed, No One WINS!"";" call network_broadcast;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
			
		};

	if(hostage1 distance getmarkerpos "hostagezone" > 125) exitwith

		{

		"
		systemChat ""The Hostage has escaped! Cops get $100000"";
		_copplayernumber = playersNumber west;
		_copbonus = 100000;
		if (dtk_cop) then {dtk_bank = (dtk_bank + _copbonus); player sidechat format[""you received $%1 for hostage taker fleeing the area"", _copbonus];};
		" call network_broadcast;
		sleep 2;
		systemChat  "The hostage has escaped the containment area, keep him inside next time!";
		workplacejob_hostage_failed = true;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
		
		
		};


	if(player distance hostage1 > 200) exitwith

		{

		"
		systemChat ""The Hostage Taker Has Lost!"";
		_copplayernumber = playersNumber west;
		_copbonus = 60000;
		if (dtk_cop) then {dtk_bank = (dtk_bank + _copbonus); player sidechat format[""you received $%1 for the successful rescue of the hostage"", _copbonus];};
		" call network_broadcast;
		sleep 2;
		systemChat  "The Hostage was rescued, mission failed!";
		workplacejob_hostage_failed = true;
		deletevehicle hostage1;
		deletemarker "htargetmarker";
		
		
		};





	_minutecounter = _minutecounter + 1;
	_secondcounter = _secondcounter + 1;
	hintsilent format["Time past: %1 m", round(_minutecounter/60)];
    	hintsilent format["Time past: %1 m", round(_minutecounter/60)];
	sleep 1;

	};
deletevehicle hostage1;
deletemarker "htargetmarker";
										
sleep ((workplacejob_hostage_break)*60);			

if (workplacejob_hostage_failed) then 

	{

	sleep ((workplacejob_hostage_break)*60);
	workplacejob_hostage_failed = false;	

	};

};