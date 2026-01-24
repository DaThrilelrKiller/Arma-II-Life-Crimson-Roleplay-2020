// Get all pending applications for employee review
private ["_player","_loans","_cards"];

_player = _this select 0;

// Check if player is employee
if !([_player] call S_credit_employeeWhitelist) exitWith {
	[_player, ["You are not authorized to view applications."], {systemChat _this}, false, false] call network_MPExec;
};

_loans = [];
_cards = [];

{
	_uid = _x select 0;
	_data = _x select 1;
	_type = _data select 0;
	_amount = _data select 1;
	_interestRate = _data select 2;
	_score = _data select 3;
	_name = _data select 4;
	_time = _data select 5;
	
	_loans set [count _loans, [_uid, _name, _amount, _interestRate, _score, _time]];
}forEach credit_pendingLoans;

{
	_uid = _x select 0;
	_data = _x select 1;
	_type = _data select 0;
	_interestRate = _data select 2;
	_score = _data select 3;
	_name = _data select 4;
	_time = _data select 5;
	
	_cards set [count _cards, [_uid, _name, _interestRate, _score, _time]];
}forEach credit_pendingCards;

// Send to client
[_player, [[_loans, _cards]], "credit_employee_getPending", false, false] call network_MPExec;

[_loans, _cards]
