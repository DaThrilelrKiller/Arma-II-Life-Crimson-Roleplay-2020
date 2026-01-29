/*
Author: DaThrillerKiller
Email: dathrillerkiller@gmail.com
Script: DTK_ServerCleaner.sqf
Description: Server cleaner that cleans the following:
-Deletes vehciles if owner is not online
-deletes all dead things
-delete empty groups
Last Motifyed: 3/17/16
Use Without permission is prohibited
*/

for "_i" from 0 to 1 step 0 do {
	amount = 0;
	uids = [];

	_CleanerVehicles = (allMissionObjects "LandVehicle") + (allMissionObjects "Air") + (allMissionObjects "ship"); /* the reson for doing this up here instead of using vehciles in the count loop. is it to make sure we dont delete any vehcile of people who logged on after the uid collector*/
		
	/*Gets list of all players UIDs*/
	{
		_UID = getPlayerUID _x;
		uids = uids + [_UID];
		amount = amount + 1;
	} count playableUnits;
	/*publicVariable "uids"; commented out untill it is needed in another scripts*/
	_uidlog = format['[SERVER CLEANER] Collected %1 player UID(s)', amount];
	amount = 0;

	/*Server Vehcile Cleaner*/
	{
		_vehsc = _x;
		if !(_vehsc call vehicle_OwnerOnline)then 
		{
			if(count crew _vehsc > 0)exitWith {};
			if ([_x,150]call Main_IsPlayerNear)exitWith {};
			amount = amount + 1;
			[_vehsc]call impound_add;
		};
	}forEach _CleanerVehicles;
	_vehlog = format['[SERVER CLEANER] Cleaned %1 Vehcile(s)',amount];
	amount = 0;

	/*Server Dead Cleaner*/
	{
		if (!(_x == player))then
		{
		 deleteVehicle _x;
		 amount = amount + 1;
		};
	} count allDead;
	_deadlog = format['[SERVER CLEANER] Cleaned %1 dead object(s)', amount];
	amount = 0;

	/*Server Group Cleaner*/
	{
				if (count units _x==0) then 
		{
					deleteGroup _x;
				   amount = amount + 1;
				};
			} count allGroups;
	_grouplog = format['[SERVER CLEANER] Cleaned %1 group(s)', amount];
	amount = 0;

	{
		if ([_x,100]call Main_IsPlayerNear)exitWith {};
		deleteVehicle _x;
		amount = amount + 1;
	} count (allMissionObjects "EvMoney") + (allMissionObjects "Suitcase") + (allMissionObjects "body") + (allMissionObjects "weaponholder");
	_itemlog = format['[SERVER CLEANER] Cleaned %1 Misc Object(s)', amount];
	amount = 0;
	uids = [];

	diag_log _uidlog;
	diag_log _vehlog;
	diag_log _deadlog;
	diag_log _grouplog;
	diag_log _itemlog;

	["ALL",["dtk_client",_vehlog,1],"network_chat",false,false]call network_MPExec;
	["ALL",["dtk_client",_deadlog,1],"network_chat",false,false]call network_MPExec;
	["ALL",["dtk_client",_grouplog,1],"network_chat",false,false]call network_MPExec;
	["ALL",["dtk_client",_itemlog,1],"network_chat",false,false]call network_MPExec;
	sleep 900;
};