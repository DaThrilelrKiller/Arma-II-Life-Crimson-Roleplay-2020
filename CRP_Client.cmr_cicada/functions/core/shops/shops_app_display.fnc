// Display shops stock data in the app
private ["_display","_stockData","_item","_shopVarName","_stock","_demandLevel","_baseBuyPrice","_baseSellPrice","_itemName","_displayText","_sortMode","_sortedData","_itemInfo","_index"];

_display = findDisplay 114;
if (isNull _display) exitWith {
	diag_log text "[SHOPS APP] Cannot display - dialog not open";
	false
};

// Use control ID directly
lbClear 3000;

// Get stock data
_stockData = if (!isNil "shops_app_stockData" && {count shops_app_stockData > 0}) then {
	shops_app_stockData
} else {
	[]
};

if (count _stockData == 0) then {
	lbAdd [3000, "No stock data available"];
	lbAdd [3000, ""];
	lbAdd [3000, "Items will appear here when players sell to shops"];
	lbAdd [3000, ""];
	lbAdd [3000, "Tip: Sell player-obtainable items to shops"];
	lbAdd [3000, "to build shop inventory and see demand levels"];
	lbAdd [3000, ""];
	lbAdd [3000, "Tracked items include:"];
	lbAdd [3000, "- Fishing items (raw & cooked)"];
	lbAdd [3000, "- Mining resources"];
	lbAdd [3000, "- Farm products"];
	lbAdd [3000, "- Processed foods"];
	lbAdd [3000, "- Drugs & seeds"];
	lbAdd [3000, "- Meat products"];
	lbAdd [3000, "- Wood & lumber"];
	lbAdd [3000, "- Oil products"];
} else {
	// Get sort mode
	_sortMode = if (isNil "shops_app_sortMode") then {"demand"} else {shops_app_sortMode};
	
	// Sort data using existing sort function
	_sortedData = [_stockData, _sortMode] call shops_app_sort;
	
	// Add header
	lbAdd [3000, "Item Name | Shop | Stock | Demand Level"];
	lbAdd [3000, "────────────────────────────────────────"];
	
	// Display each item
	{
		_shopVarName = _x select 0;
		_item = _x select 1;
		_stock = _x select 2;
		_demandLevel = _x select 3;
		
		// Get item info
		_itemInfo = _item call config_array;
		if (count _itemInfo > 0) then {
			// Get base prices for display
			_baseBuyPrice = _itemInfo call config_buycost;
			_baseSellPrice = _itemInfo call config_sellcost;
			
			// Get item display name
			_itemName = _itemInfo call config_displayname;
			
			// Format display text (simplified - show base prices, adjusted prices would require async calls)
			_displayText = format["%1 | %2 | %3 | %4",
				_itemName,
				_shopVarName,
				_stock,
				_demandLevel
			];
			
			_index = lbAdd [3000, _displayText];
			lbSetData [3000, _index, str _x];
		} else {
			// Fallback if item not found in config
			_displayText = format["%1 | %2 | %3 | %4",
				_item,
				_shopVarName,
				_stock,
				_demandLevel
			];
			_index = lbAdd [3000, _displayText];
			lbSetData [3000, _index, str _x];
		};
	}forEach _sortedData;
};

true
