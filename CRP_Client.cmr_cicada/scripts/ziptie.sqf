private ["civ"];
_civ = dtk_unit;

if(animationstate _civ == "civilsitting03" or animationstate _civ == "civilsitting02" or animationstate _civ == "civilsitting01" or animationstate _civ == "civilsitting") exitwith
{
	["ALL",[_civ,"boundCaptive_unaErc"],"network_SwitchMove",false,true]call network_MPExec;
	systemChat  "You Release The Player!";
};

if(vehicle _civ != _civ)exitwith{
	systemChat  "The Civilian Is In A Vehicle!"
};

if (!(_civ call ISSE_IsVictim)) exitwith {
	systemChat  localize "STRS_inventory_checknohandszip"
};

if(animationstate _civ == "CivilSitting") exitwith {
	systemChat  "Already ziptied"
}; 

if([player,"ziptie",-1] call storage_add) then{
	(format ["%1 playmove ""%2"";", player, "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"]) call network_broadcast;
	["ALL",[_civ,"CivilSitting"],"network_SwitchMove",false,true]call network_MPExec;
	(format['systemChat "%3 was zip tied by %2";', _civ, name player, name _civ]) call network_broadcast;
};


