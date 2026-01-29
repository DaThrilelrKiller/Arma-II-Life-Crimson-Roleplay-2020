// Get current stock for a shop/item combination
private ["_shopVarName","_item","_index","_stock"];

_shopVarName = _this select 0;
_item = _this select 1;

// Find stock entry in memory
_index = -1;
{
	if ((_x select 0) == _shopVarName && (_x select 1) == _item) exitWith {
		_index = _forEachIndex;
	};
}forEach shops_stockData;

if (_index == -1) then {
	// No stock entry found in memory, try to load from database
	_stock = ["shops", _shopVarName, _item, 0] call s_stats_read;
	
	// Convert to number if it's a string
	if (typeName _stock == "STRING") then {
		_stock = parseNumber _stock;
	};
	if (isNil "_stock" || {typeName _stock != "SCALAR"}) then {
		_stock = 0;
	};
	
	// Add to stockData array (even if 0, so we know we've checked)
	shops_stockData set [count shops_stockData, [_shopVarName, _item, _stock]];
} else {
	_stock = (shops_stockData select _index) select 2;
};

_stock
