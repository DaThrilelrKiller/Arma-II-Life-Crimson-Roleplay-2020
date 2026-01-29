private["_object","_inventory","_items","_amount"];
_object = _this select 0;

_inventory = _object getVariable ["dtk_storage",[[],[]]];
_items = _inventory select 0;
_amount = _inventory select 1;

{
	if (_x call config_illegal)then
	{
		[_object,_x,0]call storage_setAmount;
	};
}forEach _items;