// Display shops stock data in the app
private ["_display","_stockData","_item","_shopVarName","_stock","_demandLevel","_baseBuyPrice","_baseSellPrice","_itemName","_displayText","_sortMode","_sortedData","_itemInfo","_index"];

_display = findDisplay 113;
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
	lbAdd [_listbox, "No stock data available"];
	lbAdd [_listbox, ""];
	lbAdd [_listbox, "Items will appear here when players sell to shops"];
	lbAdd [_listbox, ""];
	lbAdd [_listbox, "Tip: Sell player-obtainable items to shops"];
	lbAdd [_listbox, "to build shop inventory and see demand levels"];
	lbAdd [_listbox, ""];
	lbAdd [_listbox, "Tracked items include:"];
	lbAdd [_listbox, "- Fishing items (raw & cooked)"];
	lbAdd [_listbox, "- Mining resources"];
	lbAdd [_listbox, "- Farm products"];
	lbAdd [_listbox, "- Processed foods"];
	lbAdd [_listbox, "- Drugs & seeds"];
	lbAdd [_listbox, "- Meat products"];
	lbAdd [_listbox, "- Wood & lumber"];
	lbAdd [_listbox, "- Oil products"];
} else {
	// Get sort mode
	_sortMode = if (isNil "shops_app_sortMode") then {"demand"} else {shops_app_sortMode};
	
	// Sort data based on mode (simplified - no async calls)
	_sortedData = _stockData;
	
	// Simple sort by stock (lowest first = high demand)
	if (_sortMode == "stock") then {
		_sortedData = [_stockData, [], {_x select 2}, "ASCEND"] call BIS_fnc_sortBy;
	} else {
		if (_sortMode == "demand") then {
			// Sort by demand level
			_sortedData = [_stockData, [], {
				private ["_demand"];
				_demand = _x select 3;
				if (_demand == "High") then {1} else {if (_demand == "Medium") then {2} else {3}}
			}, "ASCEND"] call BIS_fnc_sortBy;
		};
	};
	
	// Add header
	lbAdd [_listbox, "Item Name | Shop | Stock | Demand Level"];
	lbAdd [_listbox, "────────────────────────────────────────"];
	
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
			
			_index = lbAdd [_listbox, _displayText];
			lbSetData [_listbox, _index, str _x];
		} else {
			// Fallback if item not found in config
			_displayText = format["%1 | %2 | %3 | %4",
				_item,
				_shopVarName,
				_stock,
				_demandLevel
			];
			_index = lbAdd [_listbox, _displayText];
			lbSetData [_listbox, _index, str _x];
		};
	}forEach _sortedData;
};

true
