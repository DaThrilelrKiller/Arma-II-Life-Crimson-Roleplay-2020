
_items = _this getVariable ["dtk_storage",[[],[]]];
_items = _storage select 0;
_iamount = _storage select 1;

{
	_item = _x;
	_amount = _iamount select _forEachIndex;
	{
		if (_item == _x select 0 && {_amount >= _x select 2})then {
			[player,_item,-_total] call storage_add;
			[player,_item2,_multi] call storage_add;
		};
	}forEach DTK_Lab_Process;
}forEach _items;