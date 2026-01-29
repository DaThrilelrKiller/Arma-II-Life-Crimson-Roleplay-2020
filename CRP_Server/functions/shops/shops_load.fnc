private ["_shop","_shopVarName","_shopIndex","_shopData","_categories","_category","_categoryIndex","_buyItems","_item","_stock","_randomStock","_loadedCount","_totalItems","_categoryInv","_savedInventories","_itemIndex","_found"];

if (!isNil "INV_ItemShops") then {
	_loadedCount = 0;
	_totalItems = 0;
	
	{
		_shop = _x select 0;
		_shopIndex = _forEachIndex;
		
		if (!isNull _shop) then {
			_shopVarName = vehicleVarName _shop;
			_shopData = _shop getVariable ["shop_data", []];
			
			if (_shopVarName == "") then {
				_shopVarName = format["Shop_%1", _shopIndex];
			};
			
			if (count _shopData == 0) then {
				diag_log formatText ["[SHOPS] Shop %1 (%2) has no shop_data, skipping", _shopIndex, _shopVarName];
			} else {
				_categories = _shopData select 2;
				_savedInventories = ["shops", _shopVarName, "shop_inventory", []] call s_stats_read;
				
				// Ensure savedInventories is an array
				if (typeName _savedInventories == "STRING") then {
					_savedInventories = call compile _savedInventories;
				};
				if (isNil "_savedInventories" || {typeName _savedInventories != "ARRAY"}) then {
					_savedInventories = [];
				};
				
				// Initialize shop_inventory as array of category inventories
				_shop setVariable ["shop_inventory", [], true];
				
				_categoryIndex = 0;
				{
					_category = _x;
					_categoryInv = [];
					
					if (count _category >= 2) then {
						_buyItems = _category select 1;
						
						if (typeName _buyItems == "ARRAY") then {
							// Get saved inventory for this category (if exists)
							_savedCategoryInv = [];
							if (_categoryIndex < count _savedInventories) then {
								_savedCategoryInv = _savedInventories select _categoryIndex;
								if (typeName _savedCategoryInv == "STRING") then {
									_savedCategoryInv = call compile _savedCategoryInv;
								};
								if (isNil "_savedCategoryInv" || {typeName _savedCategoryInv != "ARRAY"}) then {
									_savedCategoryInv = [];
								};
							};
							
							{
								_item = _x;
								
								if (typeName _item == "STRING") then {
									_stock = 0;
									_found = false;
									
									// Check if this is a player item and we have saved stock
									if (_item in shops_playerItems) then {
										// Look for saved stock in savedCategoryInv
										{
											if (typeName _x == "ARRAY" && {count _x >= 2} && {(_x select 0) == _item}) exitWith {
												_stock = _x select 1;
												if (typeName _stock == "STRING") then {
													_stock = parseNumber _stock;
												};
												if (isNil "_stock" || {typeName _stock != "SCALAR"} || {_stock < 0}) then {
													_stock = round (10 + random 40);
												} else {
													_loadedCount = _loadedCount + 1;
													_found = true;
												};
											};
										}forEach _savedCategoryInv;
										
										if (!_found) then {
											// No saved stock, generate random
											_stock = round (10 + random 40);
											diag_log formatText ["[SHOPS] No saved stock for %1/%2 (cat %3), setting random: %4", _shopVarName, _item, _categoryIndex, _stock];
										}
									} else {
										// Non-player item, always generate random stock
										_stock = round (10 + random 40);
									};
									
									// Add to category inventory
									_categoryInv set [count _categoryInv, [_item, _stock]];
									_totalItems = _totalItems + 1;
								};
							}forEach _buyItems;
						};
					};
					
					// Add category inventory to shop inventory
					_inv = _shop getVariable ["shop_inventory", []];
					_inv set [count _inv, _categoryInv];
					_shop setVariable ["shop_inventory", _inv, true];
					
					_categoryIndex = _categoryIndex + 1;
				}forEach _categories;
				
				diag_log formatText ["[SHOPS] Shop %1 (%2) initialized with %3 categories, %4 total items", _shopIndex, _shopVarName, count _categories, _totalItems];
			};
		};
	}forEach INV_ItemShops;
	
	diag_log formatText ["[SHOPS] Loaded %1 existing stock entries, initialized %2 total items across all shops", _loadedCount, _totalItems];
} else {
	diag_log text "[SHOPS] WARNING: INV_ItemShops not found, cannot load shop stock";
};

true
