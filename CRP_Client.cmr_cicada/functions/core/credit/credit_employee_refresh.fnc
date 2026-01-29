// Refresh employee interface
private ["_applications","_loans","_cards"];

if (!dialog)exitWith {};

// Get pending applications
credit_pendingData = nil;
["SERVER",[player],"S_credit_getPendingApplications",false,false]call network_MPExec;
waitUntil {!isNil "credit_pendingData"};
_applications = credit_pendingData;
_loans = _applications select 0;
_cards = _applications select 1;

// Clear lists
lbClear 1500; // Loan list
lbClear 1501; // Card list

// Populate loan applications
{
	_uid = _x select 0;
	_name = _x select 1;
	_amount = _x select 2;
	_interestRate = _x select 3;
	_score = _x select 4;
	_time = _x select 5;
	
	_index = lbAdd [1500, format ["%1 - %2 (Score: %3)", _name, [_amount] call Main_FormatMoney, _score]];
	lbSetData [1500, _index, format ["%1|%2", _uid, _forEachIndex]];
}forEach _loans;

// Populate card applications
{
	_uid = _x select 0;
	_name = _x select 1;
	_interestRate = _x select 2;
	_score = _x select 3;
	_time = _x select 4;
	
	_index = lbAdd [1501, format ["%1 (Score: %2)", _name, _score]];
	lbSetData [1501, _index, format ["%1|%2", _uid, _forEachIndex]];
}forEach _cards;

credit_pendingData = nil;

// Update display counts
CtrlSetText [1000, format ["Pending Loans: %1", count _loans]];
CtrlSetText [1001, format ["Pending Cards: %1", count _cards]];
