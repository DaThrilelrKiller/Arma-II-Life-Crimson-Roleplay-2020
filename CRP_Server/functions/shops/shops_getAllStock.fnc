private ["_allData","_shop","_shopVarName","_inv","_item","_stock","_demandLevel"];

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
			
			{
				_item = _x select 0;
				_stock = _x select 1;
				
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
						_demandLevel
					]];
				};
			}forEach _inv;
		};
	}forEach INV_ItemShops;
};

_allData
