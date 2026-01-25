// Load cases into listbox
private ["_listbox","_case","_caseID","_plaintiffName","_defendantName","_charges","_status","_index"];
_listbox = 2001;
lbClear _listbox;

// Request cases from server
["ALL", [player], "court_syncCases", false, false] call network_MPExec;

// Wait a moment for sync
sleep 0.1;

{
	_case = _x;
	_caseID = _case select 0;
	_plaintiffName = _case select 1;
	_defendantName = _case select 3;
	_charges = _case select 5;
	_status = _case select 6;
	
	_index = lbAdd [_listbox, format["Case #%1: %2 vs %3 - %4 [%5]", _caseID, _plaintiffName, _defendantName, _charges, _status]];
	lbSetData [_listbox, _index, str _caseID];
} forEach court_cases;

lbSetCurSel [_listbox, 0];
