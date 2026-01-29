_money  = [player,"geld"] call storage_amount;
_total = _money + dtk_bank;


if (_total < dtk_amount) exitwith 
{
	["ALL",format["%1 did not have enough money to pay the ticket of $%2",name player,dtk_amount],{systemchat _this},false,true]call network_MPExec;
}; 	

dtk_payed = true;
	
["ALL",[dtk_reason,dtk_amount,player],"ticket_collect",false,true]call network_MPExec;
	
if (_total > dtk_amount) exitWith
{
	_money = if (dtk_amount >= _money)then{_money}else{dtk_amount};
	_bank = dtk_amount - _money;
	[player,'geld', -(_money)] call storage_add;
	dtk_bank = dtk_bank - _bank;
	closeDialog 0;
};