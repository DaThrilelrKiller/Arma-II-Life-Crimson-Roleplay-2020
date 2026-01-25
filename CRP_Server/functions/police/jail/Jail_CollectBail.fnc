private ["_reason","_amount","_unit","_bounty"];

_amount = _this select 0;
_unit = _this select 1;

systemchat format["%1 paid bail of $%2",name _unit,_amount];

if (dtk_cop) then{
	systemChat  format["You got $%1 because paid bail of %2",_amount,name _unit];
	[player,"geld",_amount] call storage_add;
};
