// Get all shop stock data formatted for app display
// Returns: [[shopVarName, item, stock, demandLevel], ...]
private ["_allData","_shopVarName","_item","_stock","_demandLevel"];

_allData = [];

// Return all stock entries with demand levels
{
	_shopVarName = _x select 0;
	_item = _x select 1;
	_stock = _x select 2;
	
	// Calculate demand level (low stock = high demand)
	_demandLevel = if (_stock <= (shops_maxStock * 0.25)) then {
		"High"
	} else {
		if (_stock <= (shops_maxStock * 0.75)) then {
			"Medium"
		} else {
			"Low"
		}
	};
	
	_allData set [count _allData, [
		_shopVarName,
		_item,
		_stock,
		_demandLevel
	]];
}forEach shops_stockData;

_allData
