private ["_shop","_shopVarName","_inv","_categoryInv","_item","_stock","_savedCount","_shopCount","_playerItemsOnly","_categoryIndex"];

if (isNil "INV_ItemShops") exitWith {
	diag_log text "[SHOPS] Cannot save - INV_ItemShops not found";
	false
};

_savedCount = 0;
_shopCount = 0;

diag_log text "[SHOPS] Starting save process...";

{
	_shop = _x select 0;
	if (!isNull _shop) then {
		if (_shop getVariable ["shop_needsSave", false]) then {
			_shopVarName = vehicleVarName _shop;
			if (_shopVarName == "") then {
				_shopVarName = format["Shop_%1", _forEachIndex];
			};
			_inv = _shop getVariable ["shop_inventory", []];
			
			// Build array of category inventories (only player items)
			_playerItemsOnly = [];
			_categoryIndex = 0;
			
			{
				_categoryInv = _x;
				_categoryPlayerItems = [];
				
				if (typeName _categoryInv == "ARRAY") then {
					{
						if (typeName _x == "ARRAY" && {count _x >= 2}) then {
							_item = _x select 0;
							_stock = _x select 1;
							
							// Only save player items
							if (_item in shops_playerItems) then {
								_categoryPlayerItems set [count _categoryPlayerItems, [_item, _stock]];
								_savedCount = _savedCount + 1;
							};
						};
					}forEach _categoryInv;
				};
				
				_playerItemsOnly set [count _playerItemsOnly, _categoryPlayerItems];
				_categoryIndex = _categoryIndex + 1;
			}forEach _inv;
			
			// Save as nested array: [[cat1_items], [cat2_items], ...]
			_result = ["shops", _shopVarName, "shop_inventory", _playerItemsOnly] call s_stats_write;
			if (_result) then {
				diag_log formatText ["[SHOPS] Saved shop %1 with %2 categories (%3 total player items)", _shopVarName, count _playerItemsOnly, _savedCount];
				_shopCount = _shopCount + 1;
			} else {
				diag_log formatText ["[SHOPS] FAILED to save shop %1", _shopVarName];
			};
			
			_shop setVariable ["shop_needsSave", false, true];
		};
	};
}forEach INV_ItemShops;

if (_savedCount > 0) then {
	diag_log formatText ["[SHOPS] Save complete: %1 player item stock entries saved from %2 shops to shops.ini", _savedCount, _shopCount];
} else {
	diag_log text "[SHOPS] No shops needed saving";
};

true
