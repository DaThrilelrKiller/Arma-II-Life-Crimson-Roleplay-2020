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
	if (!(createDialog "lawsdialog")) exitWith {hint "Dialog Error!";};

	private ["_disp","_ctrlGov","_ctrlPreview"];
	_disp = findDisplay 7700;
	_ctrlGov = _disp displayCtrl 901;
	_ctrlPreview = _disp displayCtrl 911;

	_mayor = call goverment_govonor;
	_mayor = if (isNull _mayor)then {"Currently no Governor"}else{name _mayor};
	_ctrlGov ctrlSetText format["Mayor (Governor): %1", _mayor];

	lbClear 910;
	lbClear 920;

	// Laws list (show empty slots as (empty) so the list stays consistent)
	private ["_i"];
	_i = 0;
	{
		private ["_lawText","_label","_idx"];
		_i = _i + 1;
		_lawText = _x;
		_label = if (_lawText == "") then {"(empty)"} else {_lawText};
		_idx = lbAdd [910, format["Law %1: %2", _i, _label]];
		// Store the real law index (0-based) as data.
		lbSetData [910, _idx, str (_i - 1)];
	} forEach GesetzArray;

	// Taxes list
	{
		private ["_name","_val"];
		_name = _x select 1;
		_val = _x select 2;
		lbAdd [920, format["%1: %2", _name, _val]];
	} forEach INV_ItemTypenArray;

	lbSetCurSel [910, 0];

	// Preview of selected law (wraps nicely)
	private ["_lastSel"];
	_lastSel = -1;
	while {!isNull (findDisplay 7700)} do
	{
		private ["_sel","_lawIdx","_raw"];
		_sel = lbCurSel 910;
		if (_sel != _lastSel && {_sel >= 0}) then
		{
			_lawIdx = call compile (lbData [910, _sel]);
			_raw = GesetzArray select _lawIdx;
			if (_raw == "") then {_raw = "(empty)";};
			_ctrlPreview ctrlSetStructuredText parseText format["<t size='1.0'>Selected: Law %1</t><br/><t size='0.9'>%2</t>", (_lawIdx + 1), _raw];
			_lastSel = _sel;
		};
		sleep 0.1;
	};
};
if (_art == "playerlist") then {
if (!(createDialog "liste_1_button")) exitWith {hint "Dialog Error!";};
    
	lbAdd [1, _trennlinie];
	lbAdd [1, localize "STRS_statdialog_playerlist"];
	lbAdd [1, _trennlinie];	

	{
		lbAdd [1, (format ["%1: %2", _x, name _x])];
		true
	}count allUnits;
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
	private ["_i"];
	_i = 0;
	{
		private ["_lawText","_label","_index"];
		_i = _i + 1;
		_lawText = _x;
		_label = if (_lawText == "") then {"(empty)"} else {_lawText};
		_index = lbAdd [1, format["Law %1: %2", _i, _label]];
		lbSetData [1, _index, _lawText];
	} forEach GesetzArray;
	
	while {ctrlVisible 1020} do 
	{
		_selected = lbCurSel 1;
		ctrlSetText [2, lbData [1, _selected]];
		ctrlSetText [4, format["%1 / 60", (ctrlText 2) call string_length]];
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
	_players = allUnits;
	for [{_k=0}, {_k < (count _players)}, {_k=_k+1}] do 
	{
		_civ	  = _players select _k;
	
		if(!isnull _civ)then
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