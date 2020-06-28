_array = _this select 3;
_art   = _array select 0;
_geld  = [player,"geld"] call storage_amount;
_zusatzString = "";
_trennlinie = "------------------------------------------------------------------------------------------";

if ((count _array)>1) then 
{
	_zusatzString = _array select 1;
};

if (_art == "lawswag") then 
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	
	lbAdd [1, _trennlinie];
	lbAdd [1, "Emita County Mayor"];
	_mayor = call goverment_govonor;
	_mayor = if (isNull _mayor)then {"Currently no Governor"}else{name _mayor};
	lbAdd [1, _mayor];


	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_laws"];		
	
	_i = 0;
	{
		if (not(_x == "")) then 
		{
			_i = _i + 1;
			lbAdd [1, (format ["%1: %2", _i, _x])];
			true
		};
	}
	count GesetzArray;

	lbAdd [1, _trennlinie];	
	lbAdd [1, localize "STRS_statdialog_taxes"];	
	{
		if ((_x select 2) > 0) then 
		{
			lbAdd [1, format["%1: %2", (_x select 1), (_x select 2)] ];	
			true
		};
	}
	count INV_ItemTypenArray;
};
if (_art == "playerlist") then
{
if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
    lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerlist"];
	lbAdd [1, _trennlinie];
	private "_i";
	
	_playuers = playableUnits;

	for [{_i=0}, {_i < (count _playuers)}, {_i=_i+1}] do 
	{
		_spieler = _playuers select _i;
		if (!isnull _spieler and isPlayer _spieler) then {lbAdd [1, (format ["%1: %2", _spieler, name _spieler])];};
	};
};	
if (_art == "oilswag") then 
{
if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	lbAdd [1, _trennlinie];
    lbAdd [1, "D E M A N D (Oil):"];
	_demand = (((tankencost - 100)/200)*100);	
	lbAdd [1, format["Oil Barrel Trader: %1", _demand ]];
};
if (_art == "fundsswag") then 
{
if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	lbAdd [1, _trennlinie];
	lbAdd [1, "Island Bank Funds:"];
	lbAdd [1, (format ["Est. total funds in the main bank safe: $%1", robpoolsafe1])];
};

if (_art == "gesetz") then 
{
	if (!(createDialog "gesetzdialog")) exitWith {hint "Dialog Error!";};
	{
		_index = lbAdd [1, _x];
		lbSetData [1, _index, _x];
	}count GesetzArray;
	
	while {ctrlVisible 1020} do 
	{
		_selected = lbCurSel 1;
		ctrlSetText [2, lbText [1, _selected]];
		waitUntil {((not(_selected == lbCurSel 1)) or (not(ctrlVisible 1020)))};
	};
};

if (_art == "coplog") then 
{
	if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
	_trennlinie = "---------------------------------------------";
	lbAdd [1, _trennlinie];
		
	private ["_k","_civ"]; 
	lbAdd [1, "C U R R E N T  W A R R A N T S:"];
	lbAdd [1, _trennlinie];
	_players = playableUnits;
	for [{_k=0}, {_k < (count _players)}, {_k=_k+1}] do 
	{
		_civ	  = _players select _k;
	
		if(!isnull _civ and isPlayer _civ)then
		{
			private ["_reason"];
			_reason = (_civ getvariable ["cdb_warrants",[]]);
			_bounty = _civ call cdb_bounty;
			
			if (count _reason > 0)then {
				lbAdd [1, (format ["%1 (Bounty: %3): %2 is wanted for:", _civ, name _civ, _bounty])];
				{
					lbAdd [1, _x select 0]; 
				
				
				}forEach _reason;
				lbAdd [1, _trennlinie];
			};
			
		};

	};

	
};

if (_art == "steuern") then 
{
	if (!(createDialog "steuerdialog")) exitWith {hint "Dialog Error!";};
	sliderSetSpeed [12, 1, 5];
	sliderSetRange [12, 0, 30];
	sliderSetPosition [12,((INV_ItemTypenArray select 0) select 2)];
	sliderSetSpeed [22, 1, 5];		sliderSetRange [22, 1, 30];	
	sliderSetPosition [22,((INV_ItemTypenArray select 1) select 2)];
	sliderSetSpeed [32, 1, 5];				sliderSetRange [32, 1, 30];
	sliderSetPosition [32,((INV_ItemTypenArray select 2) select 2)];
	sliderSetSpeed [42, 1, 5];					
	sliderSetRange [42, 0, 30];			
	sliderSetPosition [42,((INV_ItemTypenArray select 3) select 2)];
	sliderSetSpeed [52, 1, 5];					
	sliderSetRange [52, 0, 30];				
	sliderSetPosition [52,bank_steuer];		
	while {ctrlVisible 1032} do 
	{
		ctrlSetText [11, format[localize "STRS_dialogandere_steuerdialog_itemsteuer", ((round(sliderPosition 12)) call string_intToString)]];
		ctrlSetText [21, format[localize "STRS_dialogandere_steuerdialog_fahrzeugsteuer", ((round(sliderPosition 22)) call string_intToString)]];
		ctrlSetText [31, format[localize "STRS_dialogandere_steuerdialog_magazinsteuer", ((round(sliderPosition 32)) call string_intToString)]];
		ctrlSetText [41, format[localize "STRS_dialogandere_steuerdialog_waffesteuer", ((round(sliderPosition 42)) call string_intToString)]];
		ctrlSetText [51, format[localize "STRS_dialogandere_steuerdialog_banksteuer", ((round(sliderPosition 52)) call string_intToString)]];
		sleep 0.1;
	};
};