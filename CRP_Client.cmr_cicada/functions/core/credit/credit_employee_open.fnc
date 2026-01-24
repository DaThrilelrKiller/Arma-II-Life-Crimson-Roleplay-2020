// Open employee interface for reviewing applications
private ["_isEmployee","_applications","_loans","_cards"];

if (dialog)exitWith {closedialog 0};

// Check if player is employee
credit_isEmployee = nil;
["SERVER",[player],"S_credit_employeeWhitelist",false,false]call network_MPExec;
waitUntil {!isNil "credit_isEmployee"};
_isEmployee = credit_isEmployee;

if (!_isEmployee) exitWith {
	systemChat "You are not authorized to access the employee interface.";
	credit_isEmployee = nil;
};

// Get pending applications
credit_pendingData = nil;
["SERVER",[player],"S_credit_getPendingApplications",false,false]call network_MPExec;
waitUntil {!isNil "credit_pendingData"};
_applications = credit_pendingData;
_loans = _applications select 0;
_cards = _applications select 1;

createDialog "credit_employee_menu";

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

// Set button actions
buttonSetAction [1600, "call credit_employee_approveLoan;"];
buttonSetAction [1601, "call credit_employee_rejectLoan;"];
buttonSetAction [1602, "call credit_employee_approveCard;"];
buttonSetAction [1603, "call credit_employee_rejectCard;"];
buttonSetAction [1604, "call credit_employee_refresh;"];
buttonSetAction [1605, "closeDialog 0;"];
