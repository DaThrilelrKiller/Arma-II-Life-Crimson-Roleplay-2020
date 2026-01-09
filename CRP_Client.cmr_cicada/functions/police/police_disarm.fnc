if !(local _this)exitWith {
	if(!(_this call ISSE_IsVictim))exitwith{hint localize "STRS_inventory_checknohands"};
	[_this,_this,"police_disarm",false,false]call network_MPExec;
	systemChat format ["%1 has been disarmed", name _this];
};

private["_hasNVG", "_hasBino"];
_hasNVG = _this hasWeapon "NVGoggles";
_hasBino = _this hasWeapon "Binocular";

removeAllWeapons _this;
{_this removeMagazine _x } forEach (magazines _this);

If (_hasNVG)  then {_this addWeapon "NVGoggles";};
If (_hasBino) then {_this addWeapon "Binocular";};

_this setVariable ["Pistol","",true];
_this setVariable ["Rifle","",true];
   
[_this]call storage_RemoveIllegal;

systemchat "You have been disarmed";