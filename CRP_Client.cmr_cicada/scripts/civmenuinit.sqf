_civmenuciv  = dtk_unit;
_civmenu_civ = civmenu_civ; 
_art         = _this select 0;

/* civilain menu basicly used to rob people and drop all their items */
if (_art == 20) exitWith 
{
	if(!(_civmenuciv call ISSE_IsVictim))exitwith{hint localize "STRS_inventory_checknohands"};
	[_civmenuciv]call storage_trunk;
};

/* Seach for controban and remove it */
if (_art == 1) exitWith 
{
	drugsvalue = 0;
	_remove = [_civmenuciv,"drug"]call storage_RemoveKind;
	
	if ((_remove select 0) > 0)then
	{
		drugsvalue = (_remove select 1);
		["ALL",[_civmenuciv,drugsvalue],{titletext [format[localize "STRS_civmenucheck_haddrugs", (_this select 0), (_this select 1)], "plain"];},false,false]call network_MPExec;
		systemChat  format[localize "STRS_civmenu_hasdrugs", _civmenuciv,  ceil(drugsvalue/25000), (drugsvalue/2)];
		[_civmenuciv,"Trafficking Drugs",drugsvalue]call cdb_addWarrant;
	}
	else
	{
		systemchat localize "STRS_civmenu_hasnodrugs";
	};
};

