private ["_reason","_amount"];

_reason = ctrlText 11;
_amount = ctrlText 10;

if !(_amount call storage_isNumber)exitWith {systemchat format ["%1 is not a valid number",_amount];};

[dtk_unit,[_reason,_amount,player,dtk_unit],"ticket_recive",false,false]call network_MPExec;
systemchat format ["You have gave %1 a ticket of %2 for %3",name dtk_unit,_amount,_reason];
closeDialog 0;