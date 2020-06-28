private ["civ"];
_civ = dtk_unit;

if(animationstate _civ == "civilsitting03" or animationstate _civ == "civilsitting02" or animationstate _civ == "civilsitting01" or animationstate _civ == "civilsitting") exitwith

{

["ALL",[_civ,"boundCaptive_unaErc"],"network_SwitchMove",false,true]call network_MPExec;
systemChat  "You Release The Player!";

};

if(vehicle _civ != _civ)exitwith{systemChat  "The Civilian Is In A Vehicle!"};
if (!(_civ call ISSE_IsVictim)) exitwith {systemChat  localize "STRS_inventory_checknohandszip"};
if(animationstate _civ == "CivilSitting") exitwith {systemChat  "Already ziptied"}; 
if(([player,"ziptie"] call storage_amount < 1) && ([player,"ziptie_bh"] call storage_amount < 1)) exitwith {systemChat  "You need a zip tie in your inventory in order to use this function."};
(format ["%1 playmove ""%2"";", player, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]) call network_broadcast;
["ALL",[_civ,"CivilSitting"],"network_SwitchMove",false,true]call network_MPExec;

_ziptiedciv = 0;
if([player,"ziptie"] call storage_amount > 0) then{
	[player,"ziptie",-1] call storage_add;
	(format['systemChat "%3 was zip tied by %2";if (AR_playerString == "%1") then {execVM "scripts\ziptie.sqf";}', _civ, name player, name _civ]) call network_broadcast;
	_ziptiedciv = 1;
};

if(([player,"ziptie_bh"] call storage_amount > 0) && (_ziptiedciv == 0)) then{
[player,"ziptie_bh",-1] call storage_add;
(format['systemChat "%3 was zip tied by Bounty Hunter %2";if (AR_playerString == "%1") then {execVM "scripts\ziptie.sqf";}', _civ, name player, name _civ]) call network_broadcast;
};

