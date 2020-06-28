if (typename _this == "OBJECT")exitWith {
	if(!(_this call ISSE_IsVictim))exitwith{hint localize "STRS_inventory_checknohands"};
	[_this,[],"police_disarm",false,false]call network_MPExec;
	systemChat format ["%1 has been disarmed", name _this];
};

private["_hasNVG", "_hasBino"];
_hasNVG = player hasWeapon "NVGoggles";
_hasBino = player hasWeapon "Binocular";

removeAllWeapons player;
{player removeMagazine _x } forEach (magazines player);

If (_hasNVG)  then {player addWeapon "NVGoggles";};
If (_hasBino) then {player addWeapon "Binocular";};

player setVariable ["Pistol","",true];
player setVariable ["Rifle","",true];
   
[player]call storage_RemoveIllegal;

systemchat "You have been disarmed";