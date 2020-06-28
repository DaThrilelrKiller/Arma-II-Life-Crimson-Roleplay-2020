private ["_wallet","_amount"];

_wallet = [player,"geld"] call storage_amount;
_amount = ctrlText 1400;

if (!(_amount call string_isInteger)) exitWith {systemChat  localize "STRS_bank_no_valid_number";};
_amount = _amount call string_toInt;  
if (_amount <= 0) exitWith {}; 

if (atm_running)exitWith {systemchat "atm script running";};
atm_running = true;

if (dtk_bank >= _amount) then 
{
	dtk_bank = dtk_bank - _amount;
	dtk_bank = round(dtk_bank);
	[player,"geld",_amount] call storage_add;	
	systemChat  format[localize "STRS_bank_withdraw_yes", (_amount call string_intToString)];	
	closeDialog 0;
} 
else 
{
	systemChat  localize "STRS_bank_no_money";
};

atm_running = false;