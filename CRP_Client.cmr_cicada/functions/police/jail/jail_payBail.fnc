_bail = (dtk_endTime - time) * 167;
_pay = parseNumber(_this select 0);
_bail = if (_bail < _pay)then{_bail}else{_pay};


_CopPayment = round(_bail/(playersNumber west));

if (_bail < 1)exitWith {};

_money  = [player,"geld"] call storage_amount;
_total = _money + dtk_bank;

if (_total > _bail) exitWith
{
	_money = if (_bail >= _money)then{_money}else{_bail};
	_bank = _bail - _money;
	[player,'geld', -(_money)] call storage_add;
	dtk_bank = dtk_bank - _bank;
	dtk_endTime = dtk_endTime - round(_bail / 167);
	systemchat format ["You have paid %1 in bail",[_bail]call main_formatMoney];
	
	["ALL",[_CopPayment,player],"Jail_CollectBail",false,false]call network_MPExec;
};

systemchat "You do not have enough money for bail";