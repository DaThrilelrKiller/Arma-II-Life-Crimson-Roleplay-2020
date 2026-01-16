private ["_action","_item","_amount"];
_action = _this select 0;
_item   = _this select 1;
_amount = _this select 2;

if (_action == "use") then 
{

	if(vehicle player != player)exitwith{systemChat  "you cannot use this in a vehicle"};
	[player,_item,-1] call storage_add;


	for "_i" from 1 to 100 step 1 do {
		
		if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
			["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
		};

		[format['Healing %1%2',_i,"%"],'data\images\items\medkit',true]call tag_notify;
		uiSleep 0.1;
		if(!alive player)exitWith {};
	};
	player setDamage 0;
	["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;	
};

