private ["_money","_total","_bank","_card"];

_money  = [player,"geld"] call storage_amount;
_card = ([player,"Debit_Card"] call storage_amount > 0);

_total = if (_card)then{_money + dtk_bank}else{_money};

if (_total >= _this) exitWith
{
	_money = if (_this >= _money)then{_money}else{_this};
	_bank = _this - _money;
	[player,'geld', -(_money)] call storage_add;
	dtk_bank = dtk_bank - _bank;
	closeDialog 0;
	true
};

false