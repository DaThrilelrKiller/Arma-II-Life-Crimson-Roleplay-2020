// Select a case from the list
private ["_listbox","_selected","_caseID","_selectedCase","_plaintiffName","_defendantName","_charges","_status","_description"];
_listbox = 2001;
_selected = lbCurSel _listbox;

if (_selected == -1) exitWith {};

_caseID = parseNumber (lbData [_listbox, _selected]);

// Find the case
_selectedCase = [];
{
	if ((_x select 0) == _caseID) then {
		_selectedCase = _x;
	};
} forEach court_cases;

if (count _selectedCase == 0) exitWith {};

court_currentCase = _selectedCase;

// Update case details display
// Case structure: [caseID, plaintiffName, plaintiffUID, defendantName, defendantUID, charges, status, judgeName, judgeUID, sentence, fine, filedTime, description]
_plaintiffName = _selectedCase select 1;
_defendantName = _selectedCase select 3;
_charges = _selectedCase select 5;
_status = _selectedCase select 6;
_description = if (count _selectedCase > 12) then { _selectedCase select 12 } else { "No description provided." };

ctrlSetText [2002, format["Case #%1", _caseID]];
ctrlSetText [2003, format["Plaintiff: %1", _plaintiffName]];
ctrlSetText [2004, format["Defendant: %1", _defendantName]];
ctrlSetText [2005, format["Charges: %1", _charges]];
ctrlSetText [2006, format["Status: %1", _status]];
ctrlSetText [2007, format["Description: %1", _description]];
