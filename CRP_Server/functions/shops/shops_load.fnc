private ["_shop","_shopVarName","_shopIndex","_shopDataIndex","_shopItems","_item","_stock","_randomStock","_loadedCount","_totalItems","_inv","_itemIndex","_found"];

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
			
			_inv = _shop getVariable "shop_inventory";
			if (isNil "_inv") then {
				_shop setVariable ["shop_inventory", [], true];
				_inv = [];
			};
			
			_shopItems = [_shop] call S_shops_getShopItems;
			
			diag_log formatText ["[SHOPS] Shop %1 (%2) sells %3 items", _shopIndex, _shopVarName, count _shopItems];
			
			{
				_item = _x;
				
				if (_item in shops_playerItems && {_item in _shopItems}) then {
					_stock = ["shops", _shopVarName, _item, -1] call s_stats_read;
					
					if (typeName _stock == "STRING") then {
						_stock = parseNumber _stock;
					};
					
					if (isNil "_stock" || {typeName _stock != "SCALAR"} || {_stock < 0}) then {
						_randomStock = round (10 + random 40);
						_stock = _randomStock;
						diag_log formatText ["[SHOPS] No stock found for %1/%2, setting random: %3", _shopVarName, _item, _stock];
					} else {
						_loadedCount = _loadedCount + 1;
					};
					
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
				};
			}forEach shops_playerItems;
		};
	}forEach INV_ItemShops;
	
	diag_log formatText ["[SHOPS] Loaded %1 existing stock entries, initialized %2 total items across all shops", _loadedCount, _totalItems];
} else {
	diag_log text "[SHOPS] WARNING: INV_ItemShops not found, cannot load shop stock";
};

true
