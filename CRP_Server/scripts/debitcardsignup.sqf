if (SigningUpForDebitCard) exitWith {systemChat  "You are already signing up for a debit card, please wait until the process is complete."};

fn_DebitCardSignupNotification = 
{
	systemChat  "You moved too far away from the Bank Teller while signing up for your debit card.";
	systemChat  "While signing up for a debit card, you must remain in the lobby of the bank.";
	SigningUpForDebitCard = false;
};

_DebitCardCount = [player,"Debit_Card"] call storage_amount;

if (_DebitCardCount == 0) then
{
	SigningUpForDebitCard = true;

	systemChat  "While signing up for a debit card, you must remain in the lobby of the bank or you will not receive your debit card.";
	systemChat  "The Bank Teller asks you to have a seat and start filling out paperwork for your debit card.";
	sleep 10;
	
	if (player distance mainbank >= 15) exitWith {[] call fn_DebitCardSignupNotification;};

	systemChat  "After you return the papers to the Bank Teller with your information and I.D. the Bank Teller starts processing your paperwork.";
	sleep 10;

	if (player distance mainbank >= 15) exitWith {[] call fn_DebitCardSignupNotification;};
	
	systemChat  "The Bank Teller has completed processing your paperwork but has some questions about your account.";
	sleep 10;

	if (player distance mainbank >= 15) exitWith {[] call fn_DebitCardSignupNotification;};

	systemChat  "After answering the Bank Teller's questions the Bank Teller hands you your brand new debit card.";
	systemChat  "If you lose your debit card, come back to the bank and get a new one.";
	systemChat  "The bank has excellent fraud prevention so you will not need to worry about anyone being able to use your debit card.";

	[player,"Debit_Card",1] call storage_add;
} else {
	systemChat  "You currently have a debit card. Come back and sign up if you lose your debit card in the future.";
};

SigningUpForDebitCard = false;