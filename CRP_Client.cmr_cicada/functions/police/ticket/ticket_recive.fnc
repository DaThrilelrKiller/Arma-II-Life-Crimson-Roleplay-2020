dtk_reason = _this select 0;
dtk_amount = parseNumber (_this select 1);
dtk_unit = _this select 2;

createDialog "ticket_pay";

systemchat format["You have reviced a ticket of %1 for %2 from %3",[dtk_amount] call Main_FormatMoney,dtk_reason,name dtk_unit];
ctrlSetText [12,format["You have reviced a ticket of %1 for %2 from %3",[dtk_amount] call Main_FormatMoney,dtk_reason,name dtk_unit]];