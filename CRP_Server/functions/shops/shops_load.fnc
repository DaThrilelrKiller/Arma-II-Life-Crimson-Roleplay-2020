// Load shop stock data from shops.ini and set variables on shop objects
private ["_shop","_shopVarName","_item","_stock","_randomStock","_loadedCount","_totalItems"];

if (!isNil "INV_ItemShops") then {
	_loadedCount = 0;
	_totalItems = 0;
	
	// Iterate through all shops
	{
		_shop = _x select 0;
		if (!isNull _shop) then {
			// Get shop variable name (format: "Shop_<index>")
			_shopVarName = format["Shop_%1", _forEachIndex];
			
			// Set shop_varName on shop object if not already set
			_varName = _shop getVariable "shop_varName";
			if (isNil "_varName") then {
				_shop setVariable ["shop_varName", _shopVarName, true];
			};
			
			// Get or initialize shop inventory variable
			_inv = _shop getVariable "shop_inventory";
			if (isNil "_inv") then {
				_shop setVariable ["shop_inventory", [], true];
				_inv = [];
			};
			
			// Load stock for each player-obtainable item
			{
				_item = _x;
				
				// Try to load from database
				_stock = ["shops", _shopVarName, _item, -1] call s_stats_read;
				
				// Convert to number if it's a string
				if (typeName _stock == "STRING") then {
					_stock = parseNumber _stock;
				};
				
				// If stock doesn't exist (returned -1 or invalid), set random 10-50
				if (isNil "_stock" || {typeName _stock != "SCALAR"} || {_stock < 0}) then {
					_randomStock = round (10 + random 40); // Random between 10-50
					_stock = _randomStock;
					diag_log formatText ["[SHOPS] No stock found for %1/%2, setting random: %3", _shopVarName, _item, _stock];
				} else {
					_loadedCount = _loadedCount + 1;
				};
				
				// Store stock in shop object variable
				// Format: shop_inventory = [[item, count], [item, count], ...]
				private ["_inv","_itemIndex","_found"];
				_inv = _shop getVariable ["shop_inventory", []];
				_itemIndex = -1;
				_found = false;
				
				{
					if ((_x select 0) == _item) exitWith {
						_itemIndex = _forEachIndex;
						_found = true;
					};
				}forEach _inv;
				
				if (_found) then {
					_inv set [_itemIndex, [_item, _stock]];
				} else {
					_inv set [count _inv, [_item, _stock]];
				};
				
				_shop setVariable ["shop_inventory", _inv, true];
				_totalItems = _totalItems + 1;
			}forEach shops_playerItems;
		};
	}forEach INV_ItemShops;
	
	diag_log formatText ["[SHOPS] Loaded %1 existing stock entries, initialized %2 total items across all shops", _loadedCount, _totalItems];
} else {
	diag_log text "[SHOPS] WARNING: INV_ItemShops not found, cannot load shop stock";
};

true
