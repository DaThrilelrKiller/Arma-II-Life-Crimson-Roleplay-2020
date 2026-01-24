// Credit Card Item Use Script
// When player uses the Credit_Card item from inventory

private ["_action","_item","_amount"];

_action = _this select 0;
_item   = _this select 1;
_amount = _this select 2;

if (_action == "use") then {
	// Check if player has active credit card account
	if (!credit_hasCard) exitWith {
		systemChat "Your credit card account is not active. Please contact Cicada Credit Company.";
	};
	
	// Show credit card information
	call credit_cardInfo;
};
