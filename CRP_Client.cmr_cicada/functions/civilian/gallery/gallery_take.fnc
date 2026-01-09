

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "You are already taking historic item";
};

if(playersNumber west < 2) exitwith { 
	systemChat "There must be atleast 2 Police Officers online to rob this!" 
};

if !(call INV_isArmed) exitWith {
	hint "You must be armed to steal from the historic gallery";
};


["ALL",[],{	titleText ["Someone is stealing a Historic item from the photo gallery!", "PLAIN DOWN"]; player  say "Bank_alarm";},false,true]call network_MPExec;


for "_i" from 1 to 100 step 1 do {
		
	[format['Stealing Historic Item... %1%2',_i,"%"],'data\images\items\exhaust',true]call tag_notify;
			
	if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
		["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
	};
		
	uiSleep 0.5;
	if(!alive player)exitWith {};
	if (_i == 100)exitWith {
		[player,"Gallery_Item",1] call storage_add;
		deleteVehicle _this;
	};
};
