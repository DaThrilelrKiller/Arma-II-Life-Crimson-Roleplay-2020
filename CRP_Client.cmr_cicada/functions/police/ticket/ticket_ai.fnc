private["_reason","_amount","_unit","_cop"];
_reason = _this select 0;
_amount = parseNumber (_this select 1);
_cop = _this select 2;
_unit = _this select 3;

if (random 1 < 0.5) then {
	["ALL",format["%1 refused to pay the ticket of %2 from %3",name _unit,_amount,name _cop],{systemchat _this},false,false]call network_MPExec;
}else{
	if ([_unit,'geld', -(_amount)] call storage_add) then {
		["ALL",format["%1 payed the ticket of %2 from %3",name _unit,_amount,name _cop],{systemchat _this},false,false]call network_MPExec;
	}else {
		["ALL",format["%1 does not have enought money to pay: %2",name _unit,_amount],{systemchat _this},false,false]call network_MPExec;
	};
};