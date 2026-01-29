// Receive credit data from server on load
private ["_data"];

_data = _this select 0;

credit_score = _data select 0;
credit_loanAmount = _data select 1;
credit_loanInterest = _data select 2;
credit_cardBalance = _data select 3;
credit_cardLimit = _data select 4;
credit_cardInterest = _data select 5;
credit_hasLoan = _data select 6;
credit_hasCard = _data select 7;
credit_lastPayment = _data select 8;
credit_paymentDue = _data select 9;

// Update max loan based on credit score
credit_loanMax = [credit_score] call credit_getMaxLoan;

diag_log formatText ["[CREDIT CLIENT] Credit data loaded - Score: %1, Loan: %2, Card: %3", credit_score, credit_loanAmount, credit_cardBalance];
