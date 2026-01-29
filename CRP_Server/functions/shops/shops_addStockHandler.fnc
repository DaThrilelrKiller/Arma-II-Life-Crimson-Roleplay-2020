// Network handler for client calls to add stock
private ["_params","_shopVarName","_item","_amount"];

_params = _this;
if (count _params >= 3) then {
	_shopVarName = _params select 0;
	_item = _params select 1;
	_amount = _params select 2;
	[_shopVarName, _item, _amount] call S_shops_addStock;
};

true
