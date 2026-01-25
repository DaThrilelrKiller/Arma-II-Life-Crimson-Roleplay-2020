private ["_uid"];

if (credit_credit_running)exitWith {systemChat "Credit system is processing, please wait...";};
credit_credit_running = true;

if (credit_hasCard) exitWith {
	systemChat "You already have a credit card.";
	credit_credit_running = false;
};

if (credit_score < 500) exitWith {
	systemChat "Your credit score is too low to qualify for a credit card. Minimum required: 500";
	credit_credit_running = false;
};

// Calculate interest rate based on credit score
private ["_interestRate"];
_interestRate = switch (true) do {
	case (credit_score >= 750): {12}; // Excellent credit
	case (credit_score >= 700): {15}; // Good credit
	case (credit_score >= 650): {18}; // Fair credit
	case (credit_score >= 600): {22}; // Poor credit
	default {25}; // Bad credit
};

// Request credit card from server
_uid = getPlayerUID player;
["SERVER",[player,_interestRate,credit_score],"S_credit_applyCard",false,false]call network_MPExec;

systemChat format ["Credit card application submitted. Interest rate: %1%%", _interestRate];
closeDialog 0;
credit_credit_running = false;
