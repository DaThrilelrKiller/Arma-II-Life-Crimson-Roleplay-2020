// Process interest and update credit scores periodically
private ["_currentTime","_data","_loanAmount","_cardBalance","_loanInterest","_cardInterest","_newLoanAmount","_newCardBalance","_newScore"];

_currentTime = time;

{
	_uid = _x select 0;
	_data = _x select 1;
	
	// Process loan interest (every hour)
	_hasLoan = _data select 6;
	if (_hasLoan) then {
		_loanAmount = _data select 1;
		_loanInterest = _data select 2;
		_paymentDue = _data select 9;
		
		// Add interest if payment is overdue
		if (_currentTime > _paymentDue && _loanAmount > 0) then {
			_interestAmount = (_loanAmount * _loanInterest) / 100;
			_newLoanAmount = _loanAmount + _interestAmount;
			_data set [1, _newLoanAmount];
			
			// Decrease credit score for late payment
			_newScore = (_data select 0) - 10;
			if (_newScore < 300) then {_newScore = 300;};
			_data set [0, _newScore];
			
			_data set [9, _currentTime + 3600]; // Next payment due
			
			// Notify player if online
			{
				if (getPlayerUID _x == _uid) then {
					private ["_formattedInterest","_formattedBalance"];
					_formattedInterest = format['$%1', _interestAmount];
					_formattedBalance = format['$%1', _newLoanAmount];
					[_x, [format ["Loan interest added: %1. New balance: %2. Credit score decreased due to late payment.", _formattedInterest, _formattedBalance]], {systemChat _this}, false, false] call network_MPExec;
				};
			}forEach allPlayers;
			
			diag_log formatText ["[CREDIT] Interest added to loan for UID: %1 - Amount: %2, New Balance: %3", _uid, _interestAmount, _newLoanAmount];
		};
	};
	
	// Process credit card interest (monthly, simplified to every 2 hours)
	_hasCard = _data select 7;
	if (_hasCard) then {
		_cardBalance = _data select 3;
		_cardInterest = _data select 5;
		_lastPayment = _data select 8;
		
		// Add interest if balance exists and 2 hours have passed
		if (_cardBalance > 0 && (_currentTime - _lastPayment) > 7200) then {
			_interestAmount = (_cardBalance * _cardInterest) / 100;
			_newCardBalance = _cardBalance + _interestAmount;
			_data set [3, _newCardBalance];
			
			// Decrease credit score for carrying balance
			_newScore = (_data select 0) - 5;
			if (_newScore < 300) then {_newScore = 300;};
			_data set [0, _newScore];
			
			_data set [8, _currentTime];
			
			// Notify player if online
			{
				if (getPlayerUID _x == _uid) then {
					private ["_formattedInterest","_formattedBalance"];
					_formattedInterest = format['$%1', _interestAmount];
					_formattedBalance = format['$%1', _newCardBalance];
					[_x, [format ["Credit card interest added: %1. New balance: %2", _formattedInterest, _formattedBalance]], {systemChat _this}, false, false] call network_MPExec;
				};
			}forEach allPlayers;
			
			diag_log formatText ["[CREDIT] Interest added to credit card for UID: %1 - Amount: %2, New Balance: %3", _uid, _interestAmount, _newCardBalance];
		};
	};
	
	// Save updated data
	[_uid, "Main", "Credit", _data] call s_stats_write;
	_x set [1, _data];
	
}forEach credit_playerData;
