_obj 	= _this;
_list	= _obj getvariable "druglist";

if(isnil "_list")exitwith{systemChat  "No Drugs Found!"};
if(count _list == 0)exitwith{systemChat  "No Drugs Found!"};

for [{_i=0}, {_i < (count _list)}, {_i=_i+1}] do 
{
	_arr	= _list select _i;
	_civ 	= _arr select 0;
	_num	= _arr select 1;
	_cost	= _arr select 2;

	systemChat  format["This Civilian Has $%2 Worth Of Drugs! Interrogation Reveals That They Were Sold By %1.", name _civ, (_num*_cost)/2];
	format['if (local server)then {[%1,"trafficking drugs",(%2/2)]call cdb_addWarrant;}; ;titletext["%3 Is Wanted For Trafficking $%2 Worth Of Drugs!", "PLAIN"]', _civ, (_num*_cost)/2, name _civ] call network_broadcast;

};

_obj setvariable["druglist", [], true];
	