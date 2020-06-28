private ["_art","_ammo","_wep","_bullet","_vel","_pos","_teiler","_shooter","_selection","_damage","_weapons"];
_art         = _this select 0;

if (_art == "hit") then 
{
	_shooter   = _this select 1;
	_selection = _this select 2;
	_damage    = _this select 3;
	if(vehicle player != player)exitWith {
		[_shooter,["dtk_client","The person you tried to tase is in a vehicle!",3],"network_chat",false,false]call network_MPExec;
	};
	if(_selection == "Legs")exitwith{if(!canstand player)exitwith{};player setHit["Legs", 1];};
	if(_selection == "Hands")exitwith{if(handshit player == 1)exitwith{};player setHit["Hands", 1];};																													
	isstunned = true;
	StunActiveTime = StunActiveTime + StunTimePerHit;
	if(vehicle player != player)exitWith{};
	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [10]; 
	"dynamicBlur" ppEffectCommit 0; 
	waitUntil {ppEffectCommitted "dynamicBlur"}; 
	"dynamicBlur" ppEffectEnable true; 
	"dynamicBlur" ppEffectAdjust [0]; 
	"dynamicBlur" ppEffectCommit StunActiveTime;

	["ALL",["dtk_client",format["%1 was tased by %2", name player, name _shooter],1],"network_chat",false,true]call network_MPExec;																																																							
	if(!(call core_prone)) then
	{
	["ALL",[player,"adthpercmstpslowwrfldnon_4"],"network_SwitchMove",false,true]call network_MPExec;
	}
	else
	{
	["ALL",[player,"adthppnemstpsraswpstdnon_2"],"network_SwitchMove",false,true]call network_MPExec;
	};
_weapons = weapons player - nonlethalweapons;
	if (count _weapons > 0) then 
	{
	{player removeWeapon _x} count _weapons;																														
	call compile format ['waffenhalter%1 = "weaponholder" createVehicle getpos player; waffenhalter%1 setVehicleInit "waffenhalter%1 = this;"; processInitCommands;', AR_playerString];
	sleep 0.5;																		
	(format ["{waffenhalter%2 ADDWEAPONCARGO [_x, 1];} count %3; waffenhalter%2 setpos %4;", player, AR_playerString, _weapons, (getpos player)]) call network_broadcast;			
	sleep 0.5;	
	};
while{StunActiveTime > 0} do {if(StunActiveTime > MaxStunTime)then{StunActiveTime = MaxStunTime}; StunActiveTime = StunActiveTime - 1; sleep 1;};
StunActiveTime = 0;
	if (animationstate player != "civillying01" and animationstate player != "civilsitting" and animationstate player != "civillying01" and animationstate player != "civilsitting02" and animationstate player != "civilsitting03") then  
	{
	isstunned = false;	
	if(player call ISSE_IsVictim)then{
	["ALL",[player,"amovppnemstpsnonwnondnon"],"network_SwitchMove",false,true]call network_MPExec;
	};																						
	};
																							
};