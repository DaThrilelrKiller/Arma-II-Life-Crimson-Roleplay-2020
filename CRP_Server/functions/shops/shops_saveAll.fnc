// Save all shop stock to shops.ini (called periodically or on events)
private ["_shop","_shopVarName","_inv","_item","_stock","_savedCount"];

if (isNil "INV_ItemShops") exitWith {
	diag_log text "[SHOPS] Cannot save - INV_ItemShops not found";
	false
};

_savedCount = 0;

// Iterate through all shops
{
	_shop = _x select 0;
	if (!isNull _shop) then {
		// Check if shop needs saving
		if (_shop getVariable ["shop_needsSave", false]) then {
			_shopVarName = format["Shop_%1", _forEachIndex];
			_inv = _shop getVariable ["shop_inventory", []];
			
			// Save each item's stock
			{
				_item = _x select 0;
				_stock = _x select 1;
				
				// Only save if item is in player-obtainable list
				if (_item in shops_playerItems) then {
					["shops", _shopVarName, _item, _stock] call s_stats_write;
					_savedCount = _savedCount + 1;
				};
			}forEach _inv;
			
			// Clear needsSave flag
			_shop setVariable ["shop_needsSave", false, true];
		};
	};
}forEach INV_ItemShops;

if (_savedCount > 0) then {
	diag_log formatText ["[SHOPS] Saved %1 stock entries to shops.ini", _savedCount];
};

true
