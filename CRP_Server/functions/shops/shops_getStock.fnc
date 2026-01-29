// Get current stock for a shop/item combination
private ["_shopVarName","_item","_index","_stock"];

_shopVarName = _this select 0;
_item = _this select 1;

// Find stock entry
_index = -1;
{
	if ((_x select 0) == _shopVarName && (_x select 1) == _item) exitWith {
		_index = _forEachIndex;
	};
}forEach shops_stockData;

if (_index == -1) then {
	// No stock entry found, try to load from database
	_stock = ["shops", _shopVarName, _item, 0] call s_stats_read;
	
	// Add to stockData array if stock exists
	if (_stock > 0) then {
		shops_stockData set [count shops_stockData, [_shopVarName, _item, _stock]];
		_index = count shops_stockData - 1;
	} else {
		_stock = 0;
	};
} else {
	_stock = (shops_stockData select _index) select 2;
};

_stock
