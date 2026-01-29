private ["_params","_shopVarName","_categoryIndex","_item","_amount","_shop","_shopData","_categories","_category","_buyItems"];

_params = _this;

// Handle different call formats:
// Old format: [shopVarName, item, amount] or [shopObject, item, amount]
// New format: [shopVarName, categoryIndex, item, amount]

if (count _params >= 3) then {
	// Check if first param is shop object or shopVarName
	_shop = _params select 0;
	if (typeName _shop == "OBJECT") then {
		_shopVarName = vehicleVarName _shop;
		if (_shopVarName == "") then {
			// Find shop index
			if (!isNil "INV_ItemShops") then {
				{
					if ((_x select 0) == _shop) exitWith {
						_shopVarName = format["Shop_%1", _forEachIndex];
					};
				}forEach INV_ItemShops;
			};
		};
		_item = _params select 1;
		_amount = _params select 2;
	} else {
		_shopVarName = _shop;
		if (count _params >= 4) then {
			// New format with category index
			_categoryIndex = _params select 1;
			_item = _params select 2;
			_amount = _params select 3;
		} else {
			// Old format without category index - need to find it
			_item = _params select 1;
			_amount = _params select 2;
			_categoryIndex = -1;
		};
	};
	
	// If category index not provided, find it by searching for the item
	if (_categoryIndex < 0) then {
		_shop = objNull;
		if (!isNil "INV_ItemShops") then {
			{
				private ["_s","_varName"];
				_s = _x select 0;
				if (!isNull _s) then {
					_varName = vehicleVarName _s;
					
					if (_varName != "" && {_varName == _shopVarName}) exitWith {
						_shop = _s;
					};
					
					if (_varName == "" && {_shopVarName == format["Shop_%1", _forEachIndex]}) exitWith {
						_shop = _s;
					};
				};
			}forEach INV_ItemShops;
		};
		
		if (!isNull _shop) then {
			_shopData = _shop getVariable ["shop_data", []];
			if (count _shopData >= 3) then {
				_categories = _shopData select 2;
				{
					_category = _x;
					if (count _category >= 2) then {
						_buyItems = _category select 1;
						if (typeName _buyItems == "ARRAY" && {_item in _buyItems}) exitWith {
							_categoryIndex = _forEachIndex;
						};
					};
				}forEach _categories;
			};
		};
	};
	
	if (_categoryIndex >= 0) then {
		[_shopVarName, _categoryIndex, _item, _amount] call S_shops_addStock;
	} else {
		diag_log formatText ["[SHOPS] Could not find category for item %1 in shop %2", _item, _shopVarName];
	};
};

true
