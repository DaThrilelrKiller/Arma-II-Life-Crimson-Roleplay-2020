// Display shops stock data in the app
private ["_display","_listbox","_stockData","_item","_shopVarName","_stock","_demandLevel","_baseBuyPrice","_baseSellPrice","_adjustedBuyPrice","_adjustedSellPrice","_profitMargin","_itemName","_displayText","_sortMode","_sortedData","_itemInfo"];

_display = findDisplay 113;
if (isNull _display) exitWith {};

_listbox = _display displayCtrl 3000;
lbClear _listbox;

// Get stock data
_stockData = if (!isNil "shops_app_stockData" && {count shops_app_stockData > 0}) then {
	shops_app_stockData
} else {
	[]
};

if (count _stockData == 0) then {
	lbAdd [_listbox, "No stock data available"];
	lbAdd [_listbox, "Items will appear here when players sell to shops"];
} else {
	// Get sort mode
	_sortMode = if (isNil "shops_app_sortMode") then {"demand"} else {shops_app_sortMode};
	
	// Sort data based on mode
	_sortedData = [_stockData, _sortMode] call shops_app_sort;
	
	// Add header
	lbAdd [_listbox, "Item | Shop | Stock | Demand | Buy $ | Sell $ | Profit"];
	
	// Display each item
	{
		_shopVarName = _x select 0;
		_item = _x select 1;
		_stock = _x select 2;
		_demandLevel = _x select 3;
		
		// Get item info and calculate prices
		_itemInfo = _item call config_array;
		if (count _itemInfo > 0) then {
			// Get base prices
			_baseBuyPrice = _itemInfo call config_buycost;
			_baseSellPrice = _itemInfo call config_sellcost;
			
			// Get adjusted prices from server
			_adjustedBuyPrice = ["SERVER", [_shopVarName, _item, _baseBuyPrice], "shops_getAdjustedPrice", false, false] call network_MPExec;
			_adjustedSellPrice = ["SERVER", [_shopVarName, _item, _baseSellPrice], "shops_getAdjustedPrice", false, false] call network_MPExec;
			
			// Fallback to base prices if server call fails
			if (isNil "_adjustedBuyPrice") then {_adjustedBuyPrice = _baseBuyPrice;};
			if (isNil "_adjustedSellPrice") then {_adjustedSellPrice = _baseSellPrice;};
			
			// Calculate profit margin
			_profitMargin = _adjustedSellPrice - _adjustedBuyPrice;
			
			// Get item display name
			_itemName = _itemInfo call config_displayname;
			
			// Format display text
			_displayText = format["%1 | %2 | %3 | %4 | $%5 | $%6 | $%7",
				_itemName,
				_shopVarName,
				_stock,
				_demandLevel,
				_adjustedBuyPrice,
				_adjustedSellPrice,
				_profitMargin
			];
			
			_index = lbAdd [_listbox, _displayText];
			lbSetData [_listbox, _index, str _x];
		};
	}forEach _sortedData;
};

true
