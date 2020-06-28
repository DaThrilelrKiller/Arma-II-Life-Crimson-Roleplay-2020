private ["_reason","_amount","_unit","_bounty"];

_reason = _this select 0;
_amount = _this select 1;
_unit = _this select 2;

systemchat format["%1 paid the ticket of $%2 for %3",name _unit,_amount,_reason];

if (dtk_cop) then{
	_amount = round(_amount/playersNumber west);
	systemChat  format["You got $%1 because the %2 paid the ticket.",_amount,name _unit];
	[player,"geld",_amount] call storage_add;
};
