private ["_art","_item","_anzahl","_closeVcl","_closest","_incarpark","_car"];

_art = _this select 0;

if (_art == "use") then 

{
if(lockpicking)exitwith{systemChat  "You Are Already Lock Picking A Vehicle!"};
_item   = _this select 1;
_anzahl = _this select 2;
_closeVcl   = dummyobj;
_closest    = -1;
_incarpark = false;

_closeVcl = (getPos player nearEntities [["LandVehicle", "Air", "ship"], 7] select 0);
if (isNil '_closeVcl')exitWith {systemChat localize "STRS_inventar_lockpick_zuweit";};

	if ([player,_closeVcl]call keys_has) then 
	{	
		systemChat  localize "STRS_inventar_lockpick_already";
	} 
		else 
		{			
		if ([10]call Main_Random) then 
		{
			lockpicking = true;	
			_car  = (nearestobjects [getpos player, ["Ship", "LandVehicle"], 6] select 0);
			["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;
			
			for "_i" from 1 to 100 step 1 do {
				[format['Lock Picking... %1%2',_i,"%"],'\crp_data\images\items\lockpick',true]call tag_notify;
				uiSleep 0.1;
				if(!alive player)exitWith {};
				if (speed _car > 1)exitWith {};
				
				if (_i == 100)exitWith {
					_keychain = _car getVariable ["dtk_keys",[]];
					_keychain set[count _keychain,(getPlayerUID player)];
					_car setVariable ["dtk_keys",_keychain, true];
					systemChat  localize "STRS_inventar_lockpick_success";																															
					["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;	
				};
				
			};
			lockpicking = false;
		} 
		else 
		{
			_car  = (nearestobjects [getpos player, ["Ship", "LandVehicle"], 6] select 0);
			["ALL",[player,"repairingkneel"],"network_SwitchMove",false,true]call network_MPExec;

			sleep 6;
				
			systemChat  localize "STRS_inventar_lockpick_noluck";
			["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;
		};
			
			if ([7]call Main_Random)then {
			["ALL",[_closeVcl,"caralarm1",250],"network_say3d",false,true]call network_MPExec;

		};
								
		[player,_item,-1] call storage_add;	

	};		
};
