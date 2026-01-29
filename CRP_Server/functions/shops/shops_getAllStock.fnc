private ["_allData","_shop","_shopVarName","_inv","_categoryInv","_categoryIndex","_item","_stock","_demandLevel"];

_allData = [];

if (!isNil "INV_ItemShops") then {
	{
		_shop = _x select 0;
		if (!isNull _shop) then {
			_shopVarName = vehicleVarName _shop;
			if (_shopVarName == "") then {
				_shopVarName = format["Shop_%1", _forEachIndex];
			};
			_inv = _shop getVariable ["shop_inventory", []];
			
			_categoryIndex = 0;
			{
				_categoryInv = _x;
				
				if (typeName _categoryInv == "ARRAY") then {
					{
						if (typeName _x == "ARRAY" && {count _x >= 2}) then {
							_item = _x select 0;
							_stock = _x select 1;
							
							if (typeName _stock == "STRING") then {
								_stock = parseNumber _stock;
							};
							if (isNil "_stock" || {typeName _stock != "SCALAR"}) then {
								_stock = 0;
							};
							
							if (_item in shops_playerItems) then {
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
									_demandLevel,
									_categoryIndex
								]];
							};
						};
					}forEach _categoryInv;
				};
				
				_categoryIndex = _categoryIndex + 1;
			}forEach _inv;
		};
	}forEach INV_ItemShops;
};

_allData
