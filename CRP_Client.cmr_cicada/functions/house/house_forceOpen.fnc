private ["_marker","_owner","_item"];

if (typename _this == "ARRAY")exitWith {
	
	_item = (_this select 1)call config_DisplayName;
	{
		_marker = format["house_%1",_ForEachINdex];
	
		if (player distance (getMarkerPos _marker) < 10)exitWith{
			for "_i" from 1 to 100 step 1 do {
				[format['Using %3... %1%2',_i,"%",_item],'\crp_data\images\items\lockpick',true]call tag_notify;
				uiSleep 0.1;
				if(!alive player)exitWith {};
				
				if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
					["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
				};
				
				if (_i == 100)exitWith {	
					_owner = _marker call house_getOwner;
					[_owner,_marker,"house_forceOpen",false,false]call network_MPExec;
					["ALL",[player," "],"network_SwitchMove",false,true]call network_MPExec;						
					systemchat "House has been opened";
				};
				
			};
		};
	}forEach dtk_house_list;
};

private ["_building","_doors","_anim"];

dtk_locked = dtk_locked - [_this];
DTK_LastLocked = time + 60;

_building  = nearestBuilding (getMarkerPos _this);
_doors = [_building]call house_doors;		
_anim = if ((typeOf _building) in ["Land_HouseV_1I4","Land_A_GeneralStore_01a_dam","Land_dum_mesto2","Land_Ind_Workshop01_01"])then {1}else{0};
			
{
	_building animate [_x, _anim];
}forEach _doors;

systemchat "Someone has force their way into your house";